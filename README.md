# openfpga-uxn

A core for Analogue Pocket that integrates the VHDL output of [uxn-fpga](https://github.com/tsalvo/uxn-fpga) (which is still an early work-in-progress [PipelineC](https://github.com/JulianKemmerer/PipelineC) FPGA implementation of [Varvara / UXN](https://100r.co/site/uxn.html) by [hundredrabbits](https://100r.co/site/home.html)).

## Running the core on an Analogue Pocket

Copy the contents of `dist/assets/`, `dist/cores/`, `dist/platforms/` into the equivalent `Assets/uxn/`, `Cores/`, `Platforms/` folders on your Analogue Pocket.

Or, unzip the latest core from the _Releases_ section, and merge+copy the `Assets`, `Cores`, and `Platforms` folders to your Analogue Pocket SD Card.

## Specs

- Display: 256x240 at 60Hz
- CPU: 19.4616 MHz
- Main RAM: 64KB Main RAM
- Stack RAM: 2x 256 bytes
- Device RAM: 256 bytes

## Known issue on Analogue OS 2.0 (Fixed in 2.1)

If you see a black screen after loading a ROM, the ROM is likely actually still running. Sometimes you need to open _Core Settings_ -> _Display Mode_, and re-select a display mode, to see video output. This was a bug on Analogue's end. Upgrading to AnalogueOS 2.1 or above fixes this issue.

## Known issue on Analogue OS <= 2.1 (Fixed in 2.2)

ROMs may need to be padded with additional empty bytes (0x00) to be an even multiple of 4 bytes. Updating to Analogue OS 2.2 fixes this issue.

## Limitations

Most Uxn device features aren't implemented (no audio, mouse, keyboard, file system, console, etc).

The display may look flickery for some ROMs unless _Frame Blending_ is enabled in the _Display Mode_ settings.

In the _Core Settings_ menu on Analogue Pocket, there is a toggle for _Double Buffering_. Some ROMs may look better with double buffering, while others may look better without it.

## Test ROMs

I added some test ROMs into the `dist/assets` folder. Some of these are slightly modified examples from the [Uxn Chibicc fork](https://github.com/lynn/chibicc) example code:

- `bounce_256_240.rom` - bouncing square demo
- `fill_test_256_240.rom` - draws a pattern of fills from bottom-right and then top-left
- `mandelbrot_256_240.rom` - draws a Mandelbrot, vertical line-by-line
- `star_256_240.rom` - draws a rotating star (demo by hikari_no_yume)
- `cube3d.rom` - draws a spinning 3D wireframe cube

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
docker run --platform linux/amd64 -t --rm -v $(pwd):/build didiermalenfant/quartus:22.1-apple-silicon quartus_sh --clean ap_core.qpf  
```

Build (example command using a Docker Quartus Image):
```
docker run --platform linux/amd64 -t --rm -v $(pwd):/build didiermalenfant/quartus:22.1-apple-silicon quartus_sh --flow compile ap_core.qpf
```

# Core Template
This is a template repository for a core which contains all of the core definition JSON files and FPGA starter code.

## Legal
Analogue’s Development program was created to further video game hardware preservation with FPGA technology. Analogue Developers have access to Analogue Pocket I/O’s so Developers can utilize cartridge adapters or interface with other pieces of original or bespoke hardware to support legacy media. Analogue does not support or endorse the unauthorized use or distribution of material protected by copyright or other intellectual property rights.
