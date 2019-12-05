# TODO dir overview and list of things that still need migration from DE1 to DE10-Standard
Maybe we can use this as a repo overview file after migration is done

| Entity | Description/ What has to be done |
| ------ | -------------------------------- |
| [src/megawizard](src/megawizard) | auto-generated memory modules (-> find out what megawizard is) |
| [src/arch.v](src/arch.v) | define the fpga version is used (based on this the files are selected in other places) |
| [src/openMSP430_defines.v](src/openMSP430_defines.v) | definition of memory size and existence of hardware multiplier |
| [src/openMSP430_fpga.v](src/openMSP430_fpga.v) | instantiation of memory modules from [src/megawizard](src/megawizard) |
| [design_files.v](design_files.v) | This file includes memory specification files from [src/megawizard](src/megawizard) |
| [run_analysis.tcl](run_analysis.tcl) | find out what this does |
