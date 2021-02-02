#include "logger.hpp"
#include "timeline_profiler.hpp"
TimelineProfiler<2> timeline;

#include "mapping_pipe.hpp"
#include "calling_pipe.hpp"
#include "json.hpp"
#include <iostream>
#include <cstring>

int main(int argc, char *argv[]) {

    Logger::priority = 4;

    if (argc == 1) {
        std::cerr << argv[0] << " init /path/to/database/prefix\n";
        std::cerr << argv[0] << " pipe /path/to/database/prefix /path/to/samples.json\n";
        std::cerr << argv[0] << " map  /path/to/database/prefix /path/to/one_sample.json\n";
        std::cerr << argv[0] << " call /path/to/database/prefix /path/to/one_sample.json\n";
        return 1;
    }
    else if (
        strcmp(argv[1], "init") != 0 and
        strcmp(argv[1], "pipe") != 0 and
        strcmp(argv[1], "map" ) != 0 and
        strcmp(argv[1], "call") != 0
    ) {
        throw std::invalid_argument("unknow action");
    }

    // 
    // define FPGA card/device/channel parameters
    //_______________________________________________________________________________

    std::vector<Device::Option> mapper_options {
        { 0, 0, 0x00000, 0x000000000ul },
        { 0, 1, 0x10000, 0x400000000ul },
        { 0, 2, 0x20000, 0x800000000ul },
        { 0, 3, 0x30000, 0xC00000000ul },
        // { 1, 0, 0x00000, 0x000000000ul },
        // { 1, 1, 0x10000, 0x400000000ul },
        // { 1, 2, 0x20000, 0x800000000ul },
        // { 1, 3, 0x30000, 0xC00000000ul }
    };
    std::vector<Device::Option> caller_options {
        { 1, 0, 0x00000, 0x000000000ul }
    };

    // std::filesystem::path prefix = argv[2];

    // if (strcmp(argv[1], "init") == 0) {
    //     // initialize FPGA DRAM memory
    //     Aligner::load_database(prefix, mapper_options);
    //     HaplotypeCaller::load_database(prefix, caller_options);
    // } else {
    //     // initialize constants
    //     Aligner::load_database(prefix);

    //     nlohmann::json samples;
    //     std::ifstream is(argv[2]);
    //     is >> samples;

    //     Queue<nlohmann::json> src; src.reserve(samples.size());
    //     Queue<nlohmann::json> dst; dst.reserve(samples.size());

    //     MappingPipe mp;
    //     mp.start(src, dst, mapper_options);

    //     // start
    //     auto time_log = fopen("time.log", "w");
    //     timeline.redirect_to(time_log);
    //     timeline.write_header();
    //     timeline.start();
    //     for (auto &&sample: samples) {
    //         if (sample.count("enable") and sample["enable"] == false) continue;
    //         src.push(std::move(sample));
    //     }
    //     src.complete();

    //     // finish
    //     std::optional<nlohmann::json> res;
    //     while (res = dst.extract());

    //     // wait
    //     mp.wait();
    //     fclose(time_log);
    // }

    
    //
    // main
    //_______________________________________________________________________________

    std::filesystem::path prefix = argv[2];

    if (strcmp(argv[1], "init") == 0) {
        // initialize FPGA DRAM memory
        Aligner::load_database(prefix, mapper_options);
        HaplotypeCaller::load_database(prefix, caller_options);
        return 0;
    } else {
        Aligner::load_database(prefix);
    }

    // std::random_device rd;
    // std::mt19937 gen(rd());

    auto time_log = fopen("time.log", "w");
    timeline.redirect_to(time_log);
    timeline.write_header();

    Queue<nlohmann::json> src;
    Queue<nlohmann::json> tmp;
    Queue<nlohmann::json> dst;

    if (strcmp(argv[1], "pipe") == 0) {

        // load sample configuration
        nlohmann::json samples;
        std::ifstream is(argv[3]);
        is >> samples;

        // init job queue
        src.reserve(samples.size());
        tmp.reserve(samples.size());
        dst.reserve(samples.size());

        // init pipelines
        MappingPipe mp;
        CallingPipe cp;
        mp.start(src, tmp, mapper_options);
        cp.start(tmp, dst, caller_options);

        // start
        timeline.start();
        for (auto &&sample: samples) {
            if (sample.count("enable") and sample["enable"] == false) continue;
            src.push(std::move(sample));
        }
        src.complete();

        // finish
        std::optional<nlohmann::json> res;
        while (res = dst.extract());

        // wait
        mp.wait();
        cp.wait();
    }
    else {
        
        // load sample configuration
        nlohmann::json sample;
        std::ifstream is(argv[3]);
        is >> sample;

        // init job queue
        src.reserve(1);
        dst.reserve(1);

        if (strcmp(argv[1], "map") == 0) {

            // init mapper
            MappingPipe mp;
            mp.start(src, dst, mapper_options);

            // start
            timeline.start();
            src.push(std::move(sample));
            src.complete();
            if (auto out = dst.extract())
                std::cout << out->dump(4) << std::endl;

            // wait
            mp.wait();
        }
        else if (strcmp(argv[1], "call") == 0) {
            
            // init mapper
            CallingPipe cp;
            cp.start(src, dst, caller_options);

            // start
            timeline.start();
            src.push(std::move(sample));
            src.complete();
            if (auto out = dst.extract())
                std::cout << out->dump(4) << std::endl;

            // wait
            cp.wait();
        }
    }
        
    fclose(time_log);

    return 0;
}

