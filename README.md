# openfpga-uxn

A core for Analogue Pocket that integrates the PipelineC version of uxn-fpga (still a work-in-progress implementation of Uxn / Varvara).

Integration steps after compiling uxn-fpga with PipelineC:
- Drag `pipelinec_output_uxn.c_1` folder from uxn-fpga project into the `scr/fpga/core/` folder
- In `vhdl_files.txt`, replace space ` ` character with newline `\n`
- In `vhdl_files.txt`, replace paths in docker container `/workdir/` with path in project: `/core`
- In `vhdl_files.txt`, use `tail` command to reverse the order of VHDL Files txt in PipelineC output, so that top-most files are listed last
- In `vhdl_files.txt`, add `set_global_assignment -name VHDL_FILE` prefix to all VHDL files from PipelineC
- Copy VHDL Files list into QSF file
- In PipelineC VHDL files, comment out any imports of `ieee.float_pkg.all;` with `--`
- In PipelineC VHDL files, look for any names that contain two underscores `__`, and replace with just one: `_`

Clean:
```
docker run --platform linux/amd64 -t --rm -v $(pwd):/build 53500e0665a3 quartus_sh --clean ap_core.qpf  
```

Build:
```
docker run --platform linux/amd64 -t --rm -v $(pwd):/build 53500e0665a3 quartus_sh --flow compile ap_core.qpf
```

# Core Template
This is a template repository for a core which contains all of the core definition JSON files and FPGA starter code.

## Legal
Analogue’s Development program was created to further video game hardware preservation with FPGA technology. Analogue Developers have access to Analogue Pocket I/O’s so Developers can utilize cartridge adapters or interface with other pieces of original or bespoke hardware to support legacy media. Analogue does not support or endorse the unauthorized use or distribution of material protected by copyright or other intellectual property rights.
