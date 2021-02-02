# 2020MSOC_Final
# Image Deblurring Processor



<br />
<p align="center">

  <h3 align="center">MSOC-HLS project github template</h3>
  
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Usage](#usage)
* [Algorithm](#algorithm)
* [References](#references)
* [Contributing](#contributing)
* [Contact](#contact)




<!-- ABOUT THE PROJECT -->
## About The Project
This is a template github repository for hls projects with credits >3.

**Directory structure**
* **README.md** - introduce the project, algorithm, reference ....
* **code/**
  * original - original code from open source if there is 
  * final (use inline pragma) - include both host and kernel code ※Note: host code must do auto-check
* **code-opt/** - Note it may have multiple code directories for different code structure, named by code-opt  (opt refer to optimization method, e.g. code-OoO  Out-Of-Order)
  * ...
* **testdata/** - include input test data, and output result data
* **script/** - makefile
  * ... - Build process shall include a trial-run with result check. 
* **impl/** - result of the implementation, only the metafile, and report, e.g. vitis summary file, HLS csynth report
      


<!-- USAGE EXAMPLES -->
## Usage
* **build process**
  * For example, if you have a host program
  ```sh
  python FIRN11MAXI.py
  ```
  * If you implemented with vitis on U50
  ```sh
  make run
  ```

<!-- Algorithm -->
## Algorithm

<!-- References -->
## References

<!-- CONTRIBUTING -->
## Contributing

<!-- CONTACT -->
## Contact



