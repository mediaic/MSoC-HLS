<project xmlns="com.autoesl.autopilot.project" name="finalconv_hls" top="convolution_hw">
    <files>
        <file name="../../finalconv_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas"/>
        <file name="finalconv.h" sc="0" tb="false" cflags="" blackbox="false"/>
        <file name="finalconv_Jan19.cpp" sc="0" tb="false" cflags="" blackbox="false"/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="solution1" status="inactive"/>
        <solution name="parallel_Cin" status="active"/>
    </solutions>
</project>

