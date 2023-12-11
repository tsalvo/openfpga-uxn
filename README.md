# openfpga-uxn

A core for Analogue Pocket that integrates the VHDL output of [uxn-fpga](https://github.com/tsalvo/uxn-fpga) (which is still an early work-in-progress [PipelineC](https://github.com/JulianKemmerer/PipelineC) FPGA implementation of [Varvara / UXN](https://100r.co/site/uxn.html) by [hundredrabbits](https://100r.co/site/home.html)).

## Running the core on an Analogue Pocket

Copy the contents of `dist/assets/`, `dist/cores/`, `dist/platforms/` into the equivalent `Assets/uxn/`, `Cores/`, `Platforms/` folders on your Analogue Pocket

## Current Specs

- 260x234 resolution
- 13 MHz CPU
- 64KB Main RAM, 2x 256B Stack RAM, 256B Device RAM (per Uxn spec)

## Limitations

Most Uxn ROMs won't work as-is, or even at all. ROMs less than 512 bytes might need to be padded with 0x00 bytes to be 512 bytes minimum. Most device features aren't implemented, and only single-pixel drawing and fills are implemented (*no sprites yet*!)

No audio

No input controls

The speed is also very slow. I'm still working on that :-)

## Test ROMs

I added some test ROMs into the `dist/assets` folder that are working / partially working. Some of these are slightly modified examples from the [Uxn Chibicc fork](https://github.com/lynn/chibicc) example code:

- `bounce_260_234.rom` - bouncing square demo
- `fill_test_260_234.rom` - draws a pattern of fills from bottom-right and then top-left
- `mandelbrot_260_234.rom` - draws a Mandelbrot, vertical line-by-line
- `star_260_234.rom` - draws a rotating star (demo by hikari_no_yume)
- `cube3d.rom` - draws a 3D cube

## Building the core yourself

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
