# openfpga-uxn

A core for Analogue Pocket that integrates the VHDL output of [uxn-fpga](https://github.com/tsalvo/uxn-fpga) (which is still an early work-in-progress [PipelineC](https://github.com/JulianKemmerer/PipelineC) FPGA implementation of [Varvara / UXN](https://100r.co/site/uxn.html) by hundredrabbits).

Integration steps after compiling [uxn-fpga](https://github.com/tsalvo/uxn-fpga) repo:
- Drag `pipelinec_output_uxn.c_1` folder from uxn-fpga project into the `scr/fpga/core/` folder
- In `vhdl_files.txt`, replace space ` ` character with newline `\n`
- In `vhdl_files.txt`, replace paths in docker container `/workdir/` with path in project: `/core`
- In `vhdl_files.txt`, add `set_global_assignment -name VHDL_FILE` prefix to all VHDL files from PipelineC
- Copy VHDL Files list into QSF file
- In PipelineC VHDL files, comment out any imports of `ieee.float_pkg.all;` with `--`

Clean (example command using a Docker Quartus Image):
```
docker run --platform linux/amd64 -t --rm -v $(pwd):/build 53500e0665a3 quartus_sh --clean ap_core.qpf  
```

Build (example command using a Docker Quartus Image):
```
docker run --platform linux/amd64 -t --rm -v $(pwd):/build 53500e0665a3 quartus_sh --flow compile ap_core.qpf
```

# Core Template
This is a template repository for a core which contains all of the core definition JSON files and FPGA starter code.

## Legal
Analogue’s Development program was created to further video game hardware preservation with FPGA technology. Analogue Developers have access to Analogue Pocket I/O’s so Developers can utilize cartridge adapters or interface with other pieces of original or bespoke hardware to support legacy media. Analogue does not support or endorse the unauthorized use or distribution of material protected by copyright or other intellectual property rights.
