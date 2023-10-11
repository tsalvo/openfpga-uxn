-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 245
entity screen_deo_0CLK_b4e73e8e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_b4e73e8e;
architecture arch of screen_deo_0CLK_b4e73e8e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ctrl_none : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal pixel : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sprite : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_ctrl_none : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_pixel : unsigned(7 downto 0);
signal REG_COMB_sprite : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_mode : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- printf_uxn_device_h_l40_c2_b855[uxn_device_h_l40_c2_b855]
signal printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c6_0499]
signal BIN_OP_EQ_uxn_device_h_l42_c6_0499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_0499_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l51_c7_74f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l42_c2_241f]
signal y_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l42_c2_241f]
signal x_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l42_c2_241f]
signal auto_advance_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l42_c2_241f]
signal is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l42_c2_241f]
signal color_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l42_c2_241f]
signal result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l42_c2_241f]
signal result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c2_241f]
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c2_241f]
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l42_c2_241f]
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c2_241f]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l42_c2_241f]
signal sprite_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l42_c2_241f]
signal pixel_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l43_c7_ea0e]
signal BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l43_c3_4efa]
signal result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l43_c3_4efa]
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l43_c3_4efa]
signal result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l51_c11_71e8]
signal BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l58_c7_58e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l51_c7_74f9]
signal y_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l51_c7_74f9]
signal x_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l51_c7_74f9]
signal auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l51_c7_74f9]
signal is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l51_c7_74f9]
signal color_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l51_c7_74f9]
signal result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l51_c7_74f9]
signal result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l51_c7_74f9]
signal result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l51_c7_74f9]
signal result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l51_c7_74f9]
signal result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l51_c7_74f9]
signal sprite_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l51_c7_74f9]
signal pixel_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l52_c7_5808]
signal BIN_OP_EQ_uxn_device_h_l52_c7_5808_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l52_c7_5808_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l52_c3_27d3]
signal result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l52_c3_27d3]
signal result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l58_c11_08ed]
signal BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_caa0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l58_c7_58e6]
signal y_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l58_c7_58e6]
signal x_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l58_c7_58e6]
signal auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l58_c7_58e6]
signal is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l58_c7_58e6]
signal color_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l58_c7_58e6]
signal result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l58_c7_58e6]
signal result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l58_c7_58e6]
signal result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l58_c7_58e6]
signal result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l58_c7_58e6]
signal result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l58_c7_58e6]
signal sprite_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l58_c7_58e6]
signal pixel_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l59_c7_8758]
signal BIN_OP_EQ_uxn_device_h_l59_c7_8758_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l59_c7_8758_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l59_c3_196b]
signal is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l59_c3_196b]
signal color_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l59_c3_196b]
signal result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l59_c3_196b]
signal result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l59_c3_196b]
signal pixel_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l62_c20_b4bf]
signal BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l62_c20_02c6]
signal BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l62_c20_fee3]
signal MUX_uxn_device_h_l62_c20_fee3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c20_fee3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c20_fee3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c20_fee3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l68_c11_d9c8]
signal BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_6521]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l68_c7_caa0]
signal y_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l68_c7_caa0]
signal x_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l68_c7_caa0]
signal auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l68_c7_caa0]
signal result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l68_c7_caa0]
signal result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l68_c7_caa0]
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l68_c7_caa0]
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l68_c7_caa0]
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l68_c7_caa0]
signal sprite_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c7_c076]
signal BIN_OP_EQ_uxn_device_h_l69_c7_c076_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_c076_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l69_c3_b388]
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l69_c3_b388]
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l75_c11_208a]
signal BIN_OP_EQ_uxn_device_h_l75_c11_208a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_208a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_8a82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l75_c7_6521]
signal y_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l75_c7_6521]
signal x_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l75_c7_6521]
signal auto_advance_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l75_c7_6521]
signal result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l75_c7_6521]
signal result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l75_c7_6521]
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l75_c7_6521]
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l75_c7_6521]
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l75_c7_6521]
signal sprite_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c7_9eca]
signal BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l76_c3_5e9d]
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l76_c3_5e9d]
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l76_c3_5e9d]
signal sprite_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c11_e900]
signal BIN_OP_EQ_uxn_device_h_l83_c11_e900_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_e900_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_1531]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l83_c7_8a82]
signal y_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l83_c7_8a82]
signal x_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l83_c7_8a82]
signal auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l83_c7_8a82]
signal result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l83_c7_8a82]
signal result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l83_c7_8a82]
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l83_c7_8a82]
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l83_c7_8a82]
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c7_d27e]
signal BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c3_fd37]
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c3_fd37]
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_df43]
signal BIN_OP_EQ_uxn_device_h_l90_c11_df43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_df43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_6643]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l90_c7_1531]
signal y_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l90_c7_1531]
signal x_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_1531]
signal auto_advance_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_1531]
signal result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l90_c7_1531]
signal result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_1531]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_1531]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_1531]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_3ea6]
signal BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l91_c3_a8ff]
signal x_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_a8ff]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_a8ff]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_9db2]
signal BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_c1de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l99_c7_6643]
signal y_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l99_c7_6643]
signal x_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_6643]
signal auto_advance_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_6643]
signal result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_6643]
signal result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_6643]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_6643]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_6643]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_960b]
signal BIN_OP_EQ_uxn_device_h_l100_c7_960b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_960b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_2de4]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_2de4]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_be94]
signal BIN_OP_EQ_uxn_device_h_l106_c11_be94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_be94_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_bc8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l106_c7_c1de]
signal y_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l106_c7_c1de]
signal x_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_c1de]
signal auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l106_c7_c1de]
signal result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l106_c7_c1de]
signal result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l106_c7_c1de]
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l106_c7_c1de]
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l106_c7_c1de]
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c7_c2a4]
signal BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l107_c3_880e]
signal x_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c3_880e]
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_880e]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l108_c4_2783]
signal BIN_OP_OR_uxn_device_h_l108_c4_2783_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_2783_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_5020]
signal BIN_OP_EQ_uxn_device_h_l114_c11_5020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_5020_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_77ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l114_c7_bc8e]
signal y_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_bc8e]
signal auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l114_c7_bc8e]
signal result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l114_c7_bc8e]
signal result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l114_c7_bc8e]
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l114_c7_bc8e]
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l114_c7_bc8e]
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l115_c7_d08f]
signal BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l115_c3_e4da]
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_e4da]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l121_c11_a47b]
signal BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_3898]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l121_c7_77ac]
signal y_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l121_c7_77ac]
signal auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l121_c7_77ac]
signal result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l121_c7_77ac]
signal result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l121_c7_77ac]
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l121_c7_77ac]
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l121_c7_77ac]
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c7_70af]
signal BIN_OP_EQ_uxn_device_h_l122_c7_70af_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_70af_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l122_c3_b69f]
signal y_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l122_c3_b69f]
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l122_c3_b69f]
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_178c]
signal BIN_OP_EQ_uxn_device_h_l130_c11_178c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_178c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_7398]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l130_c7_3898]
signal y_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_3898]
signal auto_advance_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l130_c7_3898]
signal result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l130_c7_3898]
signal result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l130_c7_3898]
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l130_c7_3898]
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l130_c7_3898]
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c7_4f30]
signal BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l131_c3_7df2]
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_7df2]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_8901]
signal BIN_OP_EQ_uxn_device_h_l137_c11_8901_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_8901_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_67db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l137_c7_7398]
signal y_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_7398]
signal auto_advance_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l137_c7_7398]
signal result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l137_c7_7398]
signal result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l137_c7_7398]
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l137_c7_7398]
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c7_7398]
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_2802]
signal BIN_OP_EQ_uxn_device_h_l138_c7_2802_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_2802_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l138_c3_5880]
signal y_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l138_c3_5880]
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_5880]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l139_c4_74d9]
signal BIN_OP_OR_uxn_device_h_l139_c4_74d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_74d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_f00e]
signal BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_f295]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_67db]
signal auto_advance_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l145_c7_67db]
signal result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l145_c7_67db]
signal result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l145_c7_67db]
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l145_c7_67db]
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l145_c7_67db]
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c7_a14a]
signal BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l146_c3_6f3c]
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l146_c3_6f3c]
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_4a56]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c27_986d]
signal BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l147_c27_3396]
signal BIN_OP_GT_uxn_device_h_l147_c27_3396_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3396_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c27_2936]
signal MUX_uxn_device_h_l147_c27_2936_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_2936_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_2936_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_2936_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c11_ff0f]
signal BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_3226]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l153_c7_f295]
signal auto_advance_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l153_c7_f295]
signal result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l153_c7_f295]
signal result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l153_c7_f295]
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l153_c7_f295]
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l153_c7_f295]
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c7_92b9]
signal BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_94c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l154_c3_6933]
signal auto_advance_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l154_c3_6933]
signal result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l154_c3_6933]
signal result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c3_6933]
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l154_c3_6933]
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l154_c3_6933]
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(0 downto 0);

-- printf_uxn_device_h_l155_c4_9bda[uxn_device_h_l155_c4_9bda]
signal printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l159_c27_847c]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l159_c27_0be0]
signal BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l165_c11_e7aa]
signal BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l165_c7_44f2]
signal result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l165_c7_44f2]
signal result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l165_c7_44f2]
signal result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l165_c7_44f2]
signal result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l166_c7_2c7e]
signal BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l166_c3_a372]
signal result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l166_c3_a372]
signal result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l166_c3_a372]
signal result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(1 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output : unsigned(15 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint4_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_d97c( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.vram_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855
printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855 : entity work.printf_uxn_device_h_l40_c2_b855_0CLK_de264c78 port map (
printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE,
printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0,
printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1);

-- BIN_OP_EQ_uxn_device_h_l42_c6_0499
BIN_OP_EQ_uxn_device_h_l42_c6_0499 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_0499_left,
BIN_OP_EQ_uxn_device_h_l42_c6_0499_right,
BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- y_MUX_uxn_device_h_l42_c2_241f
y_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l42_c2_241f_cond,
y_MUX_uxn_device_h_l42_c2_241f_iftrue,
y_MUX_uxn_device_h_l42_c2_241f_iffalse,
y_MUX_uxn_device_h_l42_c2_241f_return_output);

-- x_MUX_uxn_device_h_l42_c2_241f
x_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l42_c2_241f_cond,
x_MUX_uxn_device_h_l42_c2_241f_iftrue,
x_MUX_uxn_device_h_l42_c2_241f_iffalse,
x_MUX_uxn_device_h_l42_c2_241f_return_output);

-- auto_advance_MUX_uxn_device_h_l42_c2_241f
auto_advance_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l42_c2_241f_cond,
auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue,
auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse,
auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output);

-- is_fill_mode_MUX_uxn_device_h_l42_c2_241f
is_fill_mode_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond,
is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue,
is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse,
is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output);

-- color_MUX_uxn_device_h_l42_c2_241f
color_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l42_c2_241f_cond,
color_MUX_uxn_device_h_l42_c2_241f_iftrue,
color_MUX_uxn_device_h_l42_c2_241f_iffalse,
color_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_vram_address_MUX_uxn_device_h_l42_c2_241f
result_vram_address_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond,
result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_vram_value_MUX_uxn_device_h_l42_c2_241f
result_vram_value_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond,
result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c2_241f
result_device_ram_address_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c2_241f
result_is_deo_done_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l42_c2_241f
result_is_vram_write_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond,
result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output);

-- sprite_MUX_uxn_device_h_l42_c2_241f
sprite_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l42_c2_241f_cond,
sprite_MUX_uxn_device_h_l42_c2_241f_iftrue,
sprite_MUX_uxn_device_h_l42_c2_241f_iffalse,
sprite_MUX_uxn_device_h_l42_c2_241f_return_output);

-- pixel_MUX_uxn_device_h_l42_c2_241f
pixel_MUX_uxn_device_h_l42_c2_241f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l42_c2_241f_cond,
pixel_MUX_uxn_device_h_l42_c2_241f_iftrue,
pixel_MUX_uxn_device_h_l42_c2_241f_iffalse,
pixel_MUX_uxn_device_h_l42_c2_241f_return_output);

-- BIN_OP_EQ_uxn_device_h_l43_c7_ea0e
BIN_OP_EQ_uxn_device_h_l43_c7_ea0e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left,
BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right,
BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa
result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond,
result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue,
result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse,
result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa
result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond,
result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa
result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond,
result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue,
result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse,
result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output);

-- BIN_OP_EQ_uxn_device_h_l51_c11_71e8
BIN_OP_EQ_uxn_device_h_l51_c11_71e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left,
BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right,
BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- y_MUX_uxn_device_h_l51_c7_74f9
y_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l51_c7_74f9_cond,
y_MUX_uxn_device_h_l51_c7_74f9_iftrue,
y_MUX_uxn_device_h_l51_c7_74f9_iffalse,
y_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- x_MUX_uxn_device_h_l51_c7_74f9
x_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l51_c7_74f9_cond,
x_MUX_uxn_device_h_l51_c7_74f9_iftrue,
x_MUX_uxn_device_h_l51_c7_74f9_iffalse,
x_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- auto_advance_MUX_uxn_device_h_l51_c7_74f9
auto_advance_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond,
auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue,
auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse,
auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- is_fill_mode_MUX_uxn_device_h_l51_c7_74f9
is_fill_mode_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond,
is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue,
is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse,
is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- color_MUX_uxn_device_h_l51_c7_74f9
color_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l51_c7_74f9_cond,
color_MUX_uxn_device_h_l51_c7_74f9_iftrue,
color_MUX_uxn_device_h_l51_c7_74f9_iffalse,
color_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- result_vram_address_MUX_uxn_device_h_l51_c7_74f9
result_vram_address_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond,
result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue,
result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse,
result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- result_vram_value_MUX_uxn_device_h_l51_c7_74f9
result_vram_value_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond,
result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue,
result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse,
result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9
result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond,
result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9
result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond,
result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9
result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond,
result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- sprite_MUX_uxn_device_h_l51_c7_74f9
sprite_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l51_c7_74f9_cond,
sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue,
sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse,
sprite_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- pixel_MUX_uxn_device_h_l51_c7_74f9
pixel_MUX_uxn_device_h_l51_c7_74f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l51_c7_74f9_cond,
pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue,
pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse,
pixel_MUX_uxn_device_h_l51_c7_74f9_return_output);

-- BIN_OP_EQ_uxn_device_h_l52_c7_5808
BIN_OP_EQ_uxn_device_h_l52_c7_5808 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l52_c7_5808_left,
BIN_OP_EQ_uxn_device_h_l52_c7_5808_right,
BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3
result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond,
result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3
result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond,
result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output);

-- BIN_OP_EQ_uxn_device_h_l58_c11_08ed
BIN_OP_EQ_uxn_device_h_l58_c11_08ed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left,
BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right,
BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- y_MUX_uxn_device_h_l58_c7_58e6
y_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l58_c7_58e6_cond,
y_MUX_uxn_device_h_l58_c7_58e6_iftrue,
y_MUX_uxn_device_h_l58_c7_58e6_iffalse,
y_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- x_MUX_uxn_device_h_l58_c7_58e6
x_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l58_c7_58e6_cond,
x_MUX_uxn_device_h_l58_c7_58e6_iftrue,
x_MUX_uxn_device_h_l58_c7_58e6_iffalse,
x_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- auto_advance_MUX_uxn_device_h_l58_c7_58e6
auto_advance_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond,
auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue,
auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse,
auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- is_fill_mode_MUX_uxn_device_h_l58_c7_58e6
is_fill_mode_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond,
is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue,
is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse,
is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- color_MUX_uxn_device_h_l58_c7_58e6
color_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l58_c7_58e6_cond,
color_MUX_uxn_device_h_l58_c7_58e6_iftrue,
color_MUX_uxn_device_h_l58_c7_58e6_iffalse,
color_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- result_vram_address_MUX_uxn_device_h_l58_c7_58e6
result_vram_address_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond,
result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue,
result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse,
result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- result_vram_value_MUX_uxn_device_h_l58_c7_58e6
result_vram_value_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond,
result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue,
result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse,
result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6
result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond,
result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6
result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond,
result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6
result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond,
result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- sprite_MUX_uxn_device_h_l58_c7_58e6
sprite_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l58_c7_58e6_cond,
sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue,
sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse,
sprite_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- pixel_MUX_uxn_device_h_l58_c7_58e6
pixel_MUX_uxn_device_h_l58_c7_58e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l58_c7_58e6_cond,
pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue,
pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse,
pixel_MUX_uxn_device_h_l58_c7_58e6_return_output);

-- BIN_OP_EQ_uxn_device_h_l59_c7_8758
BIN_OP_EQ_uxn_device_h_l59_c7_8758 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l59_c7_8758_left,
BIN_OP_EQ_uxn_device_h_l59_c7_8758_right,
BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output);

-- is_fill_mode_MUX_uxn_device_h_l59_c3_196b
is_fill_mode_MUX_uxn_device_h_l59_c3_196b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond,
is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue,
is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse,
is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output);

-- color_MUX_uxn_device_h_l59_c3_196b
color_MUX_uxn_device_h_l59_c3_196b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l59_c3_196b_cond,
color_MUX_uxn_device_h_l59_c3_196b_iftrue,
color_MUX_uxn_device_h_l59_c3_196b_iffalse,
color_MUX_uxn_device_h_l59_c3_196b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l59_c3_196b
result_is_deo_done_MUX_uxn_device_h_l59_c3_196b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond,
result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l59_c3_196b
result_device_ram_address_MUX_uxn_device_h_l59_c3_196b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond,
result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output);

-- pixel_MUX_uxn_device_h_l59_c3_196b
pixel_MUX_uxn_device_h_l59_c3_196b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l59_c3_196b_cond,
pixel_MUX_uxn_device_h_l59_c3_196b_iftrue,
pixel_MUX_uxn_device_h_l59_c3_196b_iffalse,
pixel_MUX_uxn_device_h_l59_c3_196b_return_output);

-- BIN_OP_AND_uxn_device_h_l62_c20_b4bf
BIN_OP_AND_uxn_device_h_l62_c20_b4bf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left,
BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right,
BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l62_c20_02c6
BIN_OP_EQ_uxn_device_h_l62_c20_02c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left,
BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right,
BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output);

-- MUX_uxn_device_h_l62_c20_fee3
MUX_uxn_device_h_l62_c20_fee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c20_fee3_cond,
MUX_uxn_device_h_l62_c20_fee3_iftrue,
MUX_uxn_device_h_l62_c20_fee3_iffalse,
MUX_uxn_device_h_l62_c20_fee3_return_output);

-- BIN_OP_EQ_uxn_device_h_l68_c11_d9c8
BIN_OP_EQ_uxn_device_h_l68_c11_d9c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left,
BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right,
BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output);

-- y_MUX_uxn_device_h_l68_c7_caa0
y_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l68_c7_caa0_cond,
y_MUX_uxn_device_h_l68_c7_caa0_iftrue,
y_MUX_uxn_device_h_l68_c7_caa0_iffalse,
y_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- x_MUX_uxn_device_h_l68_c7_caa0
x_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l68_c7_caa0_cond,
x_MUX_uxn_device_h_l68_c7_caa0_iftrue,
x_MUX_uxn_device_h_l68_c7_caa0_iffalse,
x_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- auto_advance_MUX_uxn_device_h_l68_c7_caa0
auto_advance_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond,
auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue,
auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse,
auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- result_vram_address_MUX_uxn_device_h_l68_c7_caa0
result_vram_address_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond,
result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue,
result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse,
result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- result_vram_value_MUX_uxn_device_h_l68_c7_caa0
result_vram_value_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond,
result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue,
result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse,
result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0
result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond,
result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0
result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond,
result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0
result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond,
result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- sprite_MUX_uxn_device_h_l68_c7_caa0
sprite_MUX_uxn_device_h_l68_c7_caa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l68_c7_caa0_cond,
sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue,
sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse,
sprite_MUX_uxn_device_h_l68_c7_caa0_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c7_c076
BIN_OP_EQ_uxn_device_h_l69_c7_c076 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c7_c076_left,
BIN_OP_EQ_uxn_device_h_l69_c7_c076_right,
BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l69_c3_b388
result_is_deo_done_MUX_uxn_device_h_l69_c3_b388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond,
result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue,
result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse,
result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l69_c3_b388
result_device_ram_address_MUX_uxn_device_h_l69_c3_b388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond,
result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue,
result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse,
result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c11_208a
BIN_OP_EQ_uxn_device_h_l75_c11_208a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c11_208a_left,
BIN_OP_EQ_uxn_device_h_l75_c11_208a_right,
BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- y_MUX_uxn_device_h_l75_c7_6521
y_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c7_6521_cond,
y_MUX_uxn_device_h_l75_c7_6521_iftrue,
y_MUX_uxn_device_h_l75_c7_6521_iffalse,
y_MUX_uxn_device_h_l75_c7_6521_return_output);

-- x_MUX_uxn_device_h_l75_c7_6521
x_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c7_6521_cond,
x_MUX_uxn_device_h_l75_c7_6521_iftrue,
x_MUX_uxn_device_h_l75_c7_6521_iffalse,
x_MUX_uxn_device_h_l75_c7_6521_return_output);

-- auto_advance_MUX_uxn_device_h_l75_c7_6521
auto_advance_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l75_c7_6521_cond,
auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue,
auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse,
auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output);

-- result_vram_address_MUX_uxn_device_h_l75_c7_6521
result_vram_address_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond,
result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue,
result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse,
result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output);

-- result_vram_value_MUX_uxn_device_h_l75_c7_6521
result_vram_value_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond,
result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue,
result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse,
result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l75_c7_6521
result_device_ram_address_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond,
result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue,
result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse,
result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l75_c7_6521
result_is_deo_done_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond,
result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue,
result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse,
result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l75_c7_6521
result_is_vram_write_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond,
result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue,
result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse,
result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output);

-- sprite_MUX_uxn_device_h_l75_c7_6521
sprite_MUX_uxn_device_h_l75_c7_6521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l75_c7_6521_cond,
sprite_MUX_uxn_device_h_l75_c7_6521_iftrue,
sprite_MUX_uxn_device_h_l75_c7_6521_iffalse,
sprite_MUX_uxn_device_h_l75_c7_6521_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c7_9eca
BIN_OP_EQ_uxn_device_h_l76_c7_9eca : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left,
BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right,
BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d
result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond,
result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d
result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond,
result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output);

-- sprite_MUX_uxn_device_h_l76_c3_5e9d
sprite_MUX_uxn_device_h_l76_c3_5e9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l76_c3_5e9d_cond,
sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue,
sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse,
sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c11_e900
BIN_OP_EQ_uxn_device_h_l83_c11_e900 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c11_e900_left,
BIN_OP_EQ_uxn_device_h_l83_c11_e900_right,
BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output);

-- y_MUX_uxn_device_h_l83_c7_8a82
y_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l83_c7_8a82_cond,
y_MUX_uxn_device_h_l83_c7_8a82_iftrue,
y_MUX_uxn_device_h_l83_c7_8a82_iffalse,
y_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- x_MUX_uxn_device_h_l83_c7_8a82
x_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l83_c7_8a82_cond,
x_MUX_uxn_device_h_l83_c7_8a82_iftrue,
x_MUX_uxn_device_h_l83_c7_8a82_iffalse,
x_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- auto_advance_MUX_uxn_device_h_l83_c7_8a82
auto_advance_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond,
auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue,
auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse,
auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- result_vram_address_MUX_uxn_device_h_l83_c7_8a82
result_vram_address_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond,
result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue,
result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse,
result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- result_vram_value_MUX_uxn_device_h_l83_c7_8a82
result_vram_value_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond,
result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue,
result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse,
result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82
result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82
result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82
result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c7_d27e
BIN_OP_EQ_uxn_device_h_l84_c7_d27e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left,
BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right,
BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37
result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37
result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_df43
BIN_OP_EQ_uxn_device_h_l90_c11_df43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_df43_left,
BIN_OP_EQ_uxn_device_h_l90_c11_df43_right,
BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output);

-- y_MUX_uxn_device_h_l90_c7_1531
y_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_1531_cond,
y_MUX_uxn_device_h_l90_c7_1531_iftrue,
y_MUX_uxn_device_h_l90_c7_1531_iffalse,
y_MUX_uxn_device_h_l90_c7_1531_return_output);

-- x_MUX_uxn_device_h_l90_c7_1531
x_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_1531_cond,
x_MUX_uxn_device_h_l90_c7_1531_iftrue,
x_MUX_uxn_device_h_l90_c7_1531_iffalse,
x_MUX_uxn_device_h_l90_c7_1531_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_1531
auto_advance_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_1531_cond,
auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_1531
result_vram_address_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output);

-- result_vram_value_MUX_uxn_device_h_l90_c7_1531
result_vram_value_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond,
result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue,
result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse,
result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_1531
result_device_ram_address_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_1531
result_is_deo_done_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_1531
result_is_vram_write_MUX_uxn_device_h_l90_c7_1531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_3ea6
BIN_OP_EQ_uxn_device_h_l91_c7_3ea6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left,
BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right,
BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output);

-- x_MUX_uxn_device_h_l91_c3_a8ff
x_MUX_uxn_device_h_l91_c3_a8ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l91_c3_a8ff_cond,
x_MUX_uxn_device_h_l91_c3_a8ff_iftrue,
x_MUX_uxn_device_h_l91_c3_a8ff_iffalse,
x_MUX_uxn_device_h_l91_c3_a8ff_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff
result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff
result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_9db2
BIN_OP_EQ_uxn_device_h_l99_c11_9db2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left,
BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right,
BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- y_MUX_uxn_device_h_l99_c7_6643
y_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_6643_cond,
y_MUX_uxn_device_h_l99_c7_6643_iftrue,
y_MUX_uxn_device_h_l99_c7_6643_iffalse,
y_MUX_uxn_device_h_l99_c7_6643_return_output);

-- x_MUX_uxn_device_h_l99_c7_6643
x_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_6643_cond,
x_MUX_uxn_device_h_l99_c7_6643_iftrue,
x_MUX_uxn_device_h_l99_c7_6643_iffalse,
x_MUX_uxn_device_h_l99_c7_6643_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_6643
auto_advance_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_6643_cond,
auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_6643
result_vram_address_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_6643
result_vram_value_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_6643
result_device_ram_address_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_6643
result_is_deo_done_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_6643
result_is_vram_write_MUX_uxn_device_h_l99_c7_6643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_960b
BIN_OP_EQ_uxn_device_h_l100_c7_960b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_960b_left,
BIN_OP_EQ_uxn_device_h_l100_c7_960b_right,
BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4
result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4
result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_be94
BIN_OP_EQ_uxn_device_h_l106_c11_be94 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_be94_left,
BIN_OP_EQ_uxn_device_h_l106_c11_be94_right,
BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- y_MUX_uxn_device_h_l106_c7_c1de
y_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_c1de_cond,
y_MUX_uxn_device_h_l106_c7_c1de_iftrue,
y_MUX_uxn_device_h_l106_c7_c1de_iffalse,
y_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- x_MUX_uxn_device_h_l106_c7_c1de
x_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_c1de_cond,
x_MUX_uxn_device_h_l106_c7_c1de_iftrue,
x_MUX_uxn_device_h_l106_c7_c1de_iffalse,
x_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_c1de
auto_advance_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond,
auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- result_vram_address_MUX_uxn_device_h_l106_c7_c1de
result_vram_address_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond,
result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue,
result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse,
result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- result_vram_value_MUX_uxn_device_h_l106_c7_c1de
result_vram_value_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond,
result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue,
result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse,
result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de
result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond,
result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue,
result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse,
result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de
result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond,
result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue,
result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse,
result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de
result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond,
result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue,
result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse,
result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c7_c2a4
BIN_OP_EQ_uxn_device_h_l107_c7_c2a4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left,
BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right,
BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output);

-- x_MUX_uxn_device_h_l107_c3_880e
x_MUX_uxn_device_h_l107_c3_880e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c3_880e_cond,
x_MUX_uxn_device_h_l107_c3_880e_iftrue,
x_MUX_uxn_device_h_l107_c3_880e_iffalse,
x_MUX_uxn_device_h_l107_c3_880e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c3_880e
result_is_deo_done_MUX_uxn_device_h_l107_c3_880e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_880e
result_device_ram_address_MUX_uxn_device_h_l107_c3_880e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output);

-- BIN_OP_OR_uxn_device_h_l108_c4_2783
BIN_OP_OR_uxn_device_h_l108_c4_2783 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l108_c4_2783_left,
BIN_OP_OR_uxn_device_h_l108_c4_2783_right,
BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_5020
BIN_OP_EQ_uxn_device_h_l114_c11_5020 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_5020_left,
BIN_OP_EQ_uxn_device_h_l114_c11_5020_right,
BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- y_MUX_uxn_device_h_l114_c7_bc8e
y_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_bc8e_cond,
y_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
y_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
y_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_bc8e
auto_advance_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond,
auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- result_vram_address_MUX_uxn_device_h_l114_c7_bc8e
result_vram_address_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond,
result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- result_vram_value_MUX_uxn_device_h_l114_c7_bc8e
result_vram_value_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond,
result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e
result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond,
result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e
result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond,
result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e
result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond,
result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output);

-- BIN_OP_EQ_uxn_device_h_l115_c7_d08f
BIN_OP_EQ_uxn_device_h_l115_c7_d08f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left,
BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right,
BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da
result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond,
result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue,
result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse,
result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da
result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output);

-- BIN_OP_EQ_uxn_device_h_l121_c11_a47b
BIN_OP_EQ_uxn_device_h_l121_c11_a47b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left,
BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right,
BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output);

-- y_MUX_uxn_device_h_l121_c7_77ac
y_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l121_c7_77ac_cond,
y_MUX_uxn_device_h_l121_c7_77ac_iftrue,
y_MUX_uxn_device_h_l121_c7_77ac_iffalse,
y_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- auto_advance_MUX_uxn_device_h_l121_c7_77ac
auto_advance_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond,
auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue,
auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse,
auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- result_vram_address_MUX_uxn_device_h_l121_c7_77ac
result_vram_address_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond,
result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue,
result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse,
result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- result_vram_value_MUX_uxn_device_h_l121_c7_77ac
result_vram_value_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond,
result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue,
result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse,
result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac
result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond,
result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue,
result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse,
result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac
result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond,
result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue,
result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse,
result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac
result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond,
result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue,
result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse,
result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c7_70af
BIN_OP_EQ_uxn_device_h_l122_c7_70af : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c7_70af_left,
BIN_OP_EQ_uxn_device_h_l122_c7_70af_right,
BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output);

-- y_MUX_uxn_device_h_l122_c3_b69f
y_MUX_uxn_device_h_l122_c3_b69f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c3_b69f_cond,
y_MUX_uxn_device_h_l122_c3_b69f_iftrue,
y_MUX_uxn_device_h_l122_c3_b69f_iffalse,
y_MUX_uxn_device_h_l122_c3_b69f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f
result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond,
result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f
result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond,
result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_178c
BIN_OP_EQ_uxn_device_h_l130_c11_178c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_178c_left,
BIN_OP_EQ_uxn_device_h_l130_c11_178c_right,
BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output);

-- y_MUX_uxn_device_h_l130_c7_3898
y_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_3898_cond,
y_MUX_uxn_device_h_l130_c7_3898_iftrue,
y_MUX_uxn_device_h_l130_c7_3898_iffalse,
y_MUX_uxn_device_h_l130_c7_3898_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_3898
auto_advance_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_3898_cond,
auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output);

-- result_vram_address_MUX_uxn_device_h_l130_c7_3898
result_vram_address_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond,
result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue,
result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse,
result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output);

-- result_vram_value_MUX_uxn_device_h_l130_c7_3898
result_vram_value_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond,
result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue,
result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse,
result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l130_c7_3898
result_device_ram_address_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond,
result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue,
result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse,
result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l130_c7_3898
result_is_deo_done_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond,
result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue,
result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse,
result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l130_c7_3898
result_is_vram_write_MUX_uxn_device_h_l130_c7_3898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond,
result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue,
result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse,
result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c7_4f30
BIN_OP_EQ_uxn_device_h_l131_c7_4f30 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left,
BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right,
BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2
result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond,
result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2
result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_8901
BIN_OP_EQ_uxn_device_h_l137_c11_8901 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_8901_left,
BIN_OP_EQ_uxn_device_h_l137_c11_8901_right,
BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output);

-- y_MUX_uxn_device_h_l137_c7_7398
y_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_7398_cond,
y_MUX_uxn_device_h_l137_c7_7398_iftrue,
y_MUX_uxn_device_h_l137_c7_7398_iffalse,
y_MUX_uxn_device_h_l137_c7_7398_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_7398
auto_advance_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_7398_cond,
auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output);

-- result_vram_address_MUX_uxn_device_h_l137_c7_7398
result_vram_address_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond,
result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue,
result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse,
result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output);

-- result_vram_value_MUX_uxn_device_h_l137_c7_7398
result_vram_value_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond,
result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue,
result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse,
result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l137_c7_7398
result_device_ram_address_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond,
result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue,
result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse,
result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l137_c7_7398
result_is_deo_done_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond,
result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue,
result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse,
result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c7_7398
result_is_vram_write_MUX_uxn_device_h_l137_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_2802
BIN_OP_EQ_uxn_device_h_l138_c7_2802 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_2802_left,
BIN_OP_EQ_uxn_device_h_l138_c7_2802_right,
BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output);

-- y_MUX_uxn_device_h_l138_c3_5880
y_MUX_uxn_device_h_l138_c3_5880 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_5880_cond,
y_MUX_uxn_device_h_l138_c3_5880_iftrue,
y_MUX_uxn_device_h_l138_c3_5880_iffalse,
y_MUX_uxn_device_h_l138_c3_5880_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l138_c3_5880
result_is_deo_done_MUX_uxn_device_h_l138_c3_5880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond,
result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue,
result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse,
result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_5880
result_device_ram_address_MUX_uxn_device_h_l138_c3_5880 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output);

-- BIN_OP_OR_uxn_device_h_l139_c4_74d9
BIN_OP_OR_uxn_device_h_l139_c4_74d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l139_c4_74d9_left,
BIN_OP_OR_uxn_device_h_l139_c4_74d9_right,
BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_f00e
BIN_OP_EQ_uxn_device_h_l145_c11_f00e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left,
BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right,
BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_67db
auto_advance_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_67db_cond,
auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output);

-- result_vram_address_MUX_uxn_device_h_l145_c7_67db
result_vram_address_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond,
result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue,
result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse,
result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output);

-- result_vram_value_MUX_uxn_device_h_l145_c7_67db
result_vram_value_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond,
result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue,
result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse,
result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l145_c7_67db
result_device_ram_address_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond,
result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue,
result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse,
result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l145_c7_67db
result_is_deo_done_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond,
result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue,
result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse,
result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l145_c7_67db
result_is_vram_write_MUX_uxn_device_h_l145_c7_67db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond,
result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue,
result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse,
result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c7_a14a
BIN_OP_EQ_uxn_device_h_l146_c7_a14a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left,
BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right,
BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c
result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond,
result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c
result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond,
result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c27_986d
BIN_OP_PLUS_uxn_device_h_l147_c27_986d : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left,
BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right,
BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output);

-- BIN_OP_GT_uxn_device_h_l147_c27_3396
BIN_OP_GT_uxn_device_h_l147_c27_3396 : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l147_c27_3396_left,
BIN_OP_GT_uxn_device_h_l147_c27_3396_right,
BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output);

-- MUX_uxn_device_h_l147_c27_2936
MUX_uxn_device_h_l147_c27_2936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c27_2936_cond,
MUX_uxn_device_h_l147_c27_2936_iftrue,
MUX_uxn_device_h_l147_c27_2936_iffalse,
MUX_uxn_device_h_l147_c27_2936_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c11_ff0f
BIN_OP_EQ_uxn_device_h_l153_c11_ff0f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left,
BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right,
BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output);

-- auto_advance_MUX_uxn_device_h_l153_c7_f295
auto_advance_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l153_c7_f295_cond,
auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue,
auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse,
auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output);

-- result_vram_address_MUX_uxn_device_h_l153_c7_f295
result_vram_address_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond,
result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue,
result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse,
result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output);

-- result_vram_value_MUX_uxn_device_h_l153_c7_f295
result_vram_value_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond,
result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue,
result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse,
result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l153_c7_f295
result_device_ram_address_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond,
result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue,
result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse,
result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l153_c7_f295
result_is_deo_done_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond,
result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue,
result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse,
result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l153_c7_f295
result_is_vram_write_MUX_uxn_device_h_l153_c7_f295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond,
result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue,
result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse,
result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c7_92b9
BIN_OP_EQ_uxn_device_h_l154_c7_92b9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left,
BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right,
BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c3_6933
auto_advance_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c3_6933_cond,
auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue,
auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse,
auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output);

-- result_vram_address_MUX_uxn_device_h_l154_c3_6933
result_vram_address_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond,
result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue,
result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse,
result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output);

-- result_vram_value_MUX_uxn_device_h_l154_c3_6933
result_vram_value_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond,
result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue,
result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse,
result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c3_6933
result_device_ram_address_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l154_c3_6933
result_is_deo_done_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond,
result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue,
result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse,
result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l154_c3_6933
result_is_vram_write_MUX_uxn_device_h_l154_c3_6933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond,
result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue,
result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse,
result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output);

-- printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda
printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda : entity work.printf_uxn_device_h_l155_c4_9bda_0CLK_de264c78 port map (
printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE,
printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0,
printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1,
printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c
BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l159_c27_0be0
BIN_OP_PLUS_uxn_device_h_l159_c27_0be0 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left,
BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right,
BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output);

-- BIN_OP_EQ_uxn_device_h_l165_c11_e7aa
BIN_OP_EQ_uxn_device_h_l165_c11_e7aa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left,
BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right,
BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output);

-- result_vram_address_MUX_uxn_device_h_l165_c7_44f2
result_vram_address_MUX_uxn_device_h_l165_c7_44f2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond,
result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue,
result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse,
result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2
result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond,
result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2
result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond,
result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output);

-- result_vram_value_MUX_uxn_device_h_l165_c7_44f2
result_vram_value_MUX_uxn_device_h_l165_c7_44f2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond,
result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue,
result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse,
result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output);

-- BIN_OP_EQ_uxn_device_h_l166_c7_2c7e
BIN_OP_EQ_uxn_device_h_l166_c7_2c7e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left,
BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right,
BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output);

-- result_vram_address_MUX_uxn_device_h_l166_c3_a372
result_vram_address_MUX_uxn_device_h_l166_c3_a372 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond,
result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue,
result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse,
result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l166_c3_a372
result_is_vram_write_MUX_uxn_device_h_l166_c3_a372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond,
result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue,
result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse,
result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output);

-- result_vram_value_MUX_uxn_device_h_l166_c3_a372
result_vram_value_MUX_uxn_device_h_l166_c3_a372 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond,
result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue,
result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse,
result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x,
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 -- Registers
 ctrl_none,
 x,
 y,
 pixel,
 sprite,
 auto_advance,
 color,
 is_fill_mode,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output,
 y_MUX_uxn_device_h_l42_c2_241f_return_output,
 x_MUX_uxn_device_h_l42_c2_241f_return_output,
 auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output,
 is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output,
 color_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output,
 sprite_MUX_uxn_device_h_l42_c2_241f_return_output,
 pixel_MUX_uxn_device_h_l42_c2_241f_return_output,
 BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output,
 result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output,
 BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output,
 y_MUX_uxn_device_h_l51_c7_74f9_return_output,
 x_MUX_uxn_device_h_l51_c7_74f9_return_output,
 auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output,
 is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output,
 color_MUX_uxn_device_h_l51_c7_74f9_return_output,
 result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output,
 result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output,
 sprite_MUX_uxn_device_h_l51_c7_74f9_return_output,
 pixel_MUX_uxn_device_h_l51_c7_74f9_return_output,
 BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output,
 result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output,
 BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output,
 y_MUX_uxn_device_h_l58_c7_58e6_return_output,
 x_MUX_uxn_device_h_l58_c7_58e6_return_output,
 auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output,
 is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output,
 color_MUX_uxn_device_h_l58_c7_58e6_return_output,
 result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output,
 result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output,
 sprite_MUX_uxn_device_h_l58_c7_58e6_return_output,
 pixel_MUX_uxn_device_h_l58_c7_58e6_return_output,
 BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output,
 is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output,
 color_MUX_uxn_device_h_l59_c3_196b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output,
 pixel_MUX_uxn_device_h_l59_c3_196b_return_output,
 BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output,
 BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output,
 MUX_uxn_device_h_l62_c20_fee3_return_output,
 BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output,
 y_MUX_uxn_device_h_l68_c7_caa0_return_output,
 x_MUX_uxn_device_h_l68_c7_caa0_return_output,
 auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output,
 result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output,
 result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output,
 sprite_MUX_uxn_device_h_l68_c7_caa0_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output,
 result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output,
 result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output,
 y_MUX_uxn_device_h_l75_c7_6521_return_output,
 x_MUX_uxn_device_h_l75_c7_6521_return_output,
 auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output,
 result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output,
 result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output,
 result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output,
 result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output,
 result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output,
 sprite_MUX_uxn_device_h_l75_c7_6521_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output,
 result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output,
 sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output,
 y_MUX_uxn_device_h_l83_c7_8a82_return_output,
 x_MUX_uxn_device_h_l83_c7_8a82_return_output,
 auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output,
 result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output,
 result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output,
 result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output,
 result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output,
 result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output,
 y_MUX_uxn_device_h_l90_c7_1531_return_output,
 x_MUX_uxn_device_h_l90_c7_1531_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output,
 result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output,
 x_MUX_uxn_device_h_l91_c3_a8ff_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output,
 y_MUX_uxn_device_h_l99_c7_6643_return_output,
 x_MUX_uxn_device_h_l99_c7_6643_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 y_MUX_uxn_device_h_l106_c7_c1de_return_output,
 x_MUX_uxn_device_h_l106_c7_c1de_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output,
 result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output,
 result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output,
 result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output,
 result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output,
 result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output,
 x_MUX_uxn_device_h_l107_c3_880e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output,
 BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output,
 y_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output,
 BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output,
 BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output,
 y_MUX_uxn_device_h_l121_c7_77ac_return_output,
 auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output,
 result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output,
 result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output,
 result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output,
 result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output,
 result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output,
 y_MUX_uxn_device_h_l122_c3_b69f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output,
 y_MUX_uxn_device_h_l130_c7_3898_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output,
 result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output,
 result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output,
 result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output,
 result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output,
 result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output,
 result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output,
 y_MUX_uxn_device_h_l137_c7_7398_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output,
 result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output,
 result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output,
 result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output,
 result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output,
 y_MUX_uxn_device_h_l138_c3_5880_return_output,
 result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output,
 BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output,
 result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output,
 result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output,
 result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output,
 result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output,
 result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output,
 BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output,
 MUX_uxn_device_h_l147_c27_2936_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output,
 auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output,
 result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output,
 result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output,
 result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output,
 result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output,
 result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output,
 auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output,
 result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output,
 result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output,
 result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output,
 result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output,
 BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output,
 BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output,
 result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output,
 result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output,
 BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output,
 result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output,
 result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output,
 result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l42_c2_241f_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l42_c2_241f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l45_c4_7c86 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l53_c4_ff15 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c3_196b_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l63_c4_fd27 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c3_196b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l61_c12_94fd_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c20_fee3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c20_fee3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c20_fee3_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c20_fee3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_6521_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l70_c4_0f3c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_6521_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l78_c4_486e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_19c9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_1e0a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l101_c4_15bd : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_5696 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l116_c4_9c1c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l125_c4_bd37 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l132_c4_5de1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l140_c4_3c36 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l148_c4_741c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_2936_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_2936_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_2936_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_2936_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l159_c4_20fa : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l157_c4_b57b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l155_c91_da5c_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l159_c27_478d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l159_c63_8594_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l169_c4_8bae : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l170_c4_25e5 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_l43_DUPLICATE_70f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d97c_uxn_device_h_l179_l33_DUPLICATE_eca5_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_ctrl_none : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_pixel : unsigned(7 downto 0);
variable REG_VAR_sprite : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_mode : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ctrl_none := ctrl_none;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_pixel := pixel;
  REG_VAR_sprite := sprite;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_color := color;
  REG_VAR_is_fill_mode := is_fill_mode;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_right := to_unsigned(12, 4);
     VAR_result_device_ram_address_uxn_device_h_l78_c4_486e := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue := VAR_result_device_ram_address_uxn_device_h_l78_c4_486e;
     VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right := to_unsigned(7, 3);
     VAR_result_device_ram_address_uxn_device_h_l109_c4_5696 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_5696;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l125_c4_bd37 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue := VAR_result_device_ram_address_uxn_device_h_l125_c4_bd37;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l62_c20_fee3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue := to_unsigned(0, 1);
     VAR_result_vram_value_uxn_device_h_l170_c4_25e5 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue := VAR_result_vram_value_uxn_device_h_l170_c4_25e5;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l132_c4_5de1 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue := VAR_result_device_ram_address_uxn_device_h_l132_c4_5de1;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l53_c4_ff15 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue := VAR_result_device_ram_address_uxn_device_h_l53_c4_ff15;
     VAR_result_device_ram_address_uxn_device_h_l101_c4_15bd := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue := VAR_result_device_ram_address_uxn_device_h_l101_c4_15bd;
     VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l62_c20_fee3_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right := to_unsigned(13, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right := to_unsigned(3, 2);
     VAR_result_device_ram_address_uxn_device_h_l70_c4_0f3c := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue := VAR_result_device_ram_address_uxn_device_h_l70_c4_0f3c;
     VAR_MUX_uxn_device_h_l147_c27_2936_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right := to_unsigned(128, 8);
     VAR_result_device_ram_address_uxn_device_h_l45_c4_7c86 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue := VAR_result_device_ram_address_uxn_device_h_l45_c4_7c86;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_right := to_unsigned(4, 3);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_1e0a := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_1e0a;
     VAR_result_vram_address_uxn_device_h_l169_c4_8bae := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue := VAR_result_vram_address_uxn_device_h_l169_c4_8bae;
     VAR_result_device_ram_address_uxn_device_h_l148_c4_741c := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue := VAR_result_device_ram_address_uxn_device_h_l148_c4_741c;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l116_c4_9c1c := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue := VAR_result_device_ram_address_uxn_device_h_l116_c4_9c1c;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_19c9 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_19c9;
     VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l140_c4_3c36 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue := VAR_result_device_ram_address_uxn_device_h_l140_c4_3c36;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l63_c4_fd27 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue := VAR_result_device_ram_address_uxn_device_h_l63_c4_fd27;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_right := to_unsigned(9, 4);
     VAR_MUX_uxn_device_h_l147_c27_2936_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l157_c4_b57b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue := VAR_result_device_ram_address_uxn_device_h_l157_c4_b57b;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right := to_unsigned(14, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_port := device_port;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l42_c2_241f_iftrue := color;
     VAR_color_MUX_uxn_device_h_l51_c7_74f9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l58_c7_58e6_iffalse := color;
     VAR_color_MUX_uxn_device_h_l59_c3_196b_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left := VAR_device_port;
     VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left := VAR_phase;
     VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right := x;
     VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l106_c7_c1de_iffalse := x;
     VAR_x_MUX_uxn_device_h_l107_c3_880e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l42_c2_241f_iftrue := x;
     VAR_x_MUX_uxn_device_h_l51_c7_74f9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l58_c7_58e6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l68_c7_caa0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l75_c7_6521_iftrue := x;
     VAR_x_MUX_uxn_device_h_l83_c7_8a82_iftrue := x;
     VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_6643_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_left := y;
     VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l106_c7_c1de_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l122_c3_b69f_iffalse := y;
     VAR_y_MUX_uxn_device_h_l130_c7_3898_iftrue := y;
     VAR_y_MUX_uxn_device_h_l137_c7_7398_iffalse := y;
     VAR_y_MUX_uxn_device_h_l138_c3_5880_iffalse := y;
     VAR_y_MUX_uxn_device_h_l42_c2_241f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l51_c7_74f9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l58_c7_58e6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l68_c7_caa0_iftrue := y;
     VAR_y_MUX_uxn_device_h_l75_c7_6521_iftrue := y;
     VAR_y_MUX_uxn_device_h_l83_c7_8a82_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_1531_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_6643_iftrue := y;
     -- CAST_TO_uint32_t[uxn_device_h_l159_c63_8594] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l159_c63_8594_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l107_c7_c2a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_left;
     BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output := BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l155_c91_da5c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l155_c91_da5c_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l76_c7_9eca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_left;
     BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output := BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l166_c7_2c7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left <= VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_left;
     BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right <= VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output := BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_960b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_960b_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_960b_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l68_c11_d9c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_left;
     BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output := BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_8901] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_8901_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_8901_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;

     -- BIN_OP_EQ[uxn_device_h_l115_c7_d08f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_left;
     BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output := BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_be94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_be94_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_be94_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c7_70af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c7_70af_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_left;
     BIN_OP_EQ_uxn_device_h_l122_c7_70af_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output := BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_5020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_5020_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_5020_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l159_c27_478d] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l159_c27_478d_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l58_c11_08ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left <= VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_left;
     BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right <= VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output := BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;

     -- BIN_OP_EQ[uxn_device_h_l59_c7_8758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l59_c7_8758_left <= VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_left;
     BIN_OP_EQ_uxn_device_h_l59_c7_8758_right <= VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output := BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;

     -- BIN_OP_EQ[uxn_device_h_l146_c7_a14a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_left;
     BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output := BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l52_c7_5808] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l52_c7_5808_left <= VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_left;
     BIN_OP_EQ_uxn_device_h_l52_c7_5808_right <= VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output := BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_3ea6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l61_c12_94fd] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l61_c12_94fd_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l99_c11_9db2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_l43_DUPLICATE_70f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_l43_DUPLICATE_70f3_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l51_c11_71e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_left;
     BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output := BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c11_208a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c11_208a_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_left;
     BIN_OP_EQ_uxn_device_h_l75_c11_208a_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output := BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l90_c11_df43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_df43_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_df43_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_f00e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c7_4f30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_left;
     BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output := BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output;

     -- BIN_OP_EQ[uxn_device_h_l69_c7_c076] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c7_c076_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_left;
     BIN_OP_EQ_uxn_device_h_l69_c7_c076_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output := BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output;

     -- printf_uxn_device_h_l40_c2_b855[uxn_device_h_l40_c2_b855] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0 <= VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg0;
     printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1 <= VAR_printf_uxn_device_h_l40_c2_b855_uxn_device_h_l40_c2_b855_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l154_c7_92b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_left;
     BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output := BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c6_0499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_0499_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_0499_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;

     -- BIN_OP_AND[uxn_device_h_l62_c20_b4bf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left <= VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_left;
     BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right <= VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output := BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l84_c7_d27e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_left;
     BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output := BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l165_c11_e7aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_left;
     BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output := BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_2802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_2802_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_2802_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_4a56] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l43_c7_ea0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left <= VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_left;
     BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right <= VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output := BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l83_c11_e900] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c11_e900_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_left;
     BIN_OP_EQ_uxn_device_h_l83_c11_e900_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output := BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_178c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_178c_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_178c_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c11_ff0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_left;
     BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output := BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l121_c11_a47b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_left;
     BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output := BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output := result.vram_address;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left := VAR_BIN_OP_AND_uxn_device_h_l62_c20_b4bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_960b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_be94_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_880e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_c2a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_bc8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_5020_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d08f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_77ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_a47b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_b69f_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_70af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_3898_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_178c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_4f30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_7398_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8901_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_5880_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_2802_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_f00e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_a14a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_ff0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_92b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l165_c11_e7aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l166_c7_2c7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_color_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_pixel_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_sprite_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_x_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_y_MUX_uxn_device_h_l42_c2_241f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_0499_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c7_ea0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_color_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_x_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_y_MUX_uxn_device_h_l51_c7_74f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c11_71e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c7_5808_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_color_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_x_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_y_MUX_uxn_device_h_l58_c7_58e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c11_08ed_return_output;
     VAR_color_MUX_uxn_device_h_l59_c3_196b_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;
     VAR_pixel_MUX_uxn_device_h_l59_c3_196b_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c7_8758_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_d9c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_c076_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_6521_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_208a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output;
     VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_9eca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_8a82_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_e900_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_d27e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_1531_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_df43_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_a8ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_3ea6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_6643_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9db2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4a56_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l92_l139_l123_DUPLICATE_0620_return_output;
     VAR_color_MUX_uxn_device_h_l59_c3_196b_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l61_c12_94fd_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left := VAR_CAST_TO_uint32_t_uxn_device_h_l159_c27_478d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right := VAR_CAST_TO_uint32_t_uxn_device_h_l159_c63_8594_return_output;
     VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l155_c91_da5c_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l138_l76_l131_l59_l84_l91_DUPLICATE_b802_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_l43_DUPLICATE_70f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_l43_DUPLICATE_70f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_92a2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_1a29_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l42_l90_l137_l154_l83_l130_l75_l121_l68_l114_l165_l58_l106_l51_l166_l99_l145_DUPLICATE_a142_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l154_l52_l100_l115_l122_l91_l138_l76_l131_l146_l153_l59_l84_l43_DUPLICATE_1157_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l84_c3_fd37] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l43_c3_4efa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_cond;
     result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output := result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_2de4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l76_c3_5e9d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_cond;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output := result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output;

     -- sprite_MUX[uxn_device_h_l76_c3_5e9d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l76_c3_5e9d_cond <= VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_cond;
     sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue <= VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iftrue;
     sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse <= VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output := sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_cond;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output := result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- BIN_OP_OR[uxn_device_h_l108_c4_2783] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l108_c4_2783_left <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_left;
     BIN_OP_OR_uxn_device_h_l108_c4_2783_right <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output := BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output;

     -- result_vram_address_MUX[uxn_device_h_l166_c3_a372] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond <= VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_cond;
     result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iftrue;
     result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output := result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l131_c3_7df2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_cond;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output := result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l138_c3_5880] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_cond;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output := result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l115_c3_e4da] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_cond;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output := result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l69_c3_b388] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_cond;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output := result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l52_c3_27d3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_cond;
     result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output := result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l43_c3_4efa] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_cond;
     result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output := result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l59_c3_196b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_cond;
     result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output := result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_a8ff] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output;

     -- result_vram_value_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_cond;
     result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iftrue;
     result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output := result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- result_vram_value_MUX[uxn_device_h_l166_c3_a372] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond <= VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_cond;
     result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iftrue;
     result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output := result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output := CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output;

     -- pixel_MUX[uxn_device_h_l59_c3_196b] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l59_c3_196b_cond <= VAR_pixel_MUX_uxn_device_h_l59_c3_196b_cond;
     pixel_MUX_uxn_device_h_l59_c3_196b_iftrue <= VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iftrue;
     pixel_MUX_uxn_device_h_l59_c3_196b_iffalse <= VAR_pixel_MUX_uxn_device_h_l59_c3_196b_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l59_c3_196b_return_output := pixel_MUX_uxn_device_h_l59_c3_196b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l166_c3_a372] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_cond;
     result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output := result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l69_c3_b388] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_cond;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output := result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l122_c3_b69f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_cond;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output := result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_cond;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output := result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l159_c27_847c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_5880] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_7df2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l76_c3_5e9d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_cond;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output := result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_2de4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output;

     -- BIN_OP_OR[uxn_device_h_l139_c4_74d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l139_c4_74d9_left <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_left;
     BIN_OP_OR_uxn_device_h_l139_c4_74d9_right <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output := BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c27_986d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_left;
     BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output := BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l165_c7_44f2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_cond;
     result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output := result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l43_c3_4efa] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output := result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l52_c3_27d3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_cond;
     result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output := result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l84_c3_fd37] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_880e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output;

     -- color_MUX[uxn_device_h_l59_c3_196b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l59_c3_196b_cond <= VAR_color_MUX_uxn_device_h_l59_c3_196b_cond;
     color_MUX_uxn_device_h_l59_c3_196b_iftrue <= VAR_color_MUX_uxn_device_h_l59_c3_196b_iftrue;
     color_MUX_uxn_device_h_l59_c3_196b_iffalse <= VAR_color_MUX_uxn_device_h_l59_c3_196b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l59_c3_196b_return_output := color_MUX_uxn_device_h_l59_c3_196b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c3_880e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l146_c3_6f3c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_cond;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output := result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l62_c20_02c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left <= VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_left;
     BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right <= VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output := BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l59_c3_196b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_cond;
     result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output := result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_e4da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l122_c3_b69f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_cond;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output := result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_cond;
     auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output := auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_a8ff] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l62_c20_fee3_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c20_02c6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l159_c27_847c_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_880e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l108_c4_2783_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_5880_iftrue := VAR_BIN_OP_OR_uxn_device_h_l139_c4_74d9_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_left := VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_986d_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_b69f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_2133_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_auto_advance_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_color_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_color_MUX_uxn_device_h_l59_c3_196b_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_pixel_MUX_uxn_device_h_l59_c3_196b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2de4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_880e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_e4da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_b69f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_7df2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_5880_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_6f3c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l43_c3_4efa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l52_c3_27d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l59_c3_196b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_b388_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_5e9d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_fd37_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_a8ff_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2de4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_880e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_e4da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_b69f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_7df2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_5880_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l165_c7_44f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l43_c3_4efa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l52_c3_27d3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l59_c3_196b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_b388_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_5e9d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_fd37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_a8ff_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c3_4efa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l166_c3_a372_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l166_c3_a372_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l166_c3_a372_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iftrue := VAR_sprite_MUX_uxn_device_h_l76_c3_5e9d_return_output;
     -- result_vram_value_MUX[uxn_device_h_l165_c7_44f2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_cond;
     result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iftrue;
     result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output := result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_cond;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output := result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- x_MUX[uxn_device_h_l107_c3_880e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c3_880e_cond <= VAR_x_MUX_uxn_device_h_l107_c3_880e_cond;
     x_MUX_uxn_device_h_l107_c3_880e_iftrue <= VAR_x_MUX_uxn_device_h_l107_c3_880e_iftrue;
     x_MUX_uxn_device_h_l107_c3_880e_iffalse <= VAR_x_MUX_uxn_device_h_l107_c3_880e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c3_880e_return_output := x_MUX_uxn_device_h_l107_c3_880e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l165_c7_44f2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_cond;
     result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output := result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output;

     -- MUX[uxn_device_h_l62_c20_fee3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c20_fee3_cond <= VAR_MUX_uxn_device_h_l62_c20_fee3_cond;
     MUX_uxn_device_h_l62_c20_fee3_iftrue <= VAR_MUX_uxn_device_h_l62_c20_fee3_iftrue;
     MUX_uxn_device_h_l62_c20_fee3_iffalse <= VAR_MUX_uxn_device_h_l62_c20_fee3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c20_fee3_return_output := MUX_uxn_device_h_l62_c20_fee3_return_output;

     -- y_MUX[uxn_device_h_l138_c3_5880] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_5880_cond <= VAR_y_MUX_uxn_device_h_l138_c3_5880_cond;
     y_MUX_uxn_device_h_l138_c3_5880_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_5880_iftrue;
     y_MUX_uxn_device_h_l138_c3_5880_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_5880_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_5880_return_output := y_MUX_uxn_device_h_l138_c3_5880_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- sprite_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_sprite_MUX_uxn_device_h_l75_c7_6521_cond;
     sprite_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iftrue;
     sprite_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_sprite_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l75_c7_6521_return_output := sprite_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- y_MUX[uxn_device_h_l122_c3_b69f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c3_b69f_cond <= VAR_y_MUX_uxn_device_h_l122_c3_b69f_cond;
     y_MUX_uxn_device_h_l122_c3_b69f_iftrue <= VAR_y_MUX_uxn_device_h_l122_c3_b69f_iftrue;
     y_MUX_uxn_device_h_l122_c3_b69f_iffalse <= VAR_y_MUX_uxn_device_h_l122_c3_b69f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c3_b69f_return_output := y_MUX_uxn_device_h_l122_c3_b69f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_cond;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output := result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- result_vram_address_MUX[uxn_device_h_l165_c7_44f2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_cond;
     result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iftrue;
     result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output := result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output;

     -- x_MUX[uxn_device_h_l91_c3_a8ff] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l91_c3_a8ff_cond <= VAR_x_MUX_uxn_device_h_l91_c3_a8ff_cond;
     x_MUX_uxn_device_h_l91_c3_a8ff_iftrue <= VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iftrue;
     x_MUX_uxn_device_h_l91_c3_a8ff_iffalse <= VAR_x_MUX_uxn_device_h_l91_c3_a8ff_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l91_c3_a8ff_return_output := x_MUX_uxn_device_h_l91_c3_a8ff_return_output;

     -- auto_advance_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_cond;
     auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iftrue;
     auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output := auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l159_c27_0be0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_left;
     BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output := BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output;

     -- pixel_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_cond;
     pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_return_output := pixel_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- color_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_color_MUX_uxn_device_h_l58_c7_58e6_cond;
     color_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_color_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     color_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_color_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l58_c7_58e6_return_output := color_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- BIN_OP_GT[uxn_device_h_l147_c27_3396] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l147_c27_3396_left <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_left;
     BIN_OP_GT_uxn_device_h_l147_c27_3396_right <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output := BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l147_c27_2936_cond := VAR_BIN_OP_GT_uxn_device_h_l147_c27_3396_return_output;
     VAR_result_vram_address_uxn_device_h_l159_c4_20fa := resize(VAR_BIN_OP_PLUS_uxn_device_h_l159_c27_0be0_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue := VAR_MUX_uxn_device_h_l62_c20_fee3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_auto_advance_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_color_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_color_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_pixel_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l165_c7_44f2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l165_c7_44f2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l165_c7_44f2_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_sprite_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_c1de_iftrue := VAR_x_MUX_uxn_device_h_l107_c3_880e_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_1531_iftrue := VAR_x_MUX_uxn_device_h_l91_c3_a8ff_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_77ac_iftrue := VAR_y_MUX_uxn_device_h_l122_c3_b69f_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_7398_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_5880_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue := VAR_result_vram_address_uxn_device_h_l159_c4_20fa;
     -- is_fill_mode_MUX[uxn_device_h_l59_c3_196b] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_cond;
     is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iftrue;
     is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output := is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output;

     -- x_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_x_MUX_uxn_device_h_l106_c7_c1de_cond;
     x_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     x_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_c1de_return_output := x_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- sprite_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_cond;
     sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_return_output := sprite_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- pixel_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_cond;
     pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_return_output := pixel_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- MUX[uxn_device_h_l147_c27_2936] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c27_2936_cond <= VAR_MUX_uxn_device_h_l147_c27_2936_cond;
     MUX_uxn_device_h_l147_c27_2936_iftrue <= VAR_MUX_uxn_device_h_l147_c27_2936_iftrue;
     MUX_uxn_device_h_l147_c27_2936_iffalse <= VAR_MUX_uxn_device_h_l147_c27_2936_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c27_2936_return_output := MUX_uxn_device_h_l147_c27_2936_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_cond;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output := result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_cond;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output := result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- y_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_y_MUX_uxn_device_h_l137_c7_7398_cond;
     y_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_7398_iftrue;
     y_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_7398_return_output := y_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- result_vram_address_MUX[uxn_device_h_l154_c3_6933] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_cond;
     result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iftrue;
     result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output := result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output;

     -- result_vram_value_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_cond;
     result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iftrue;
     result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output := result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output := auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- color_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_color_MUX_uxn_device_h_l51_c7_74f9_cond;
     color_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_color_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     color_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_color_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l51_c7_74f9_return_output := color_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue := VAR_MUX_uxn_device_h_l147_c27_2936_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_color_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_color_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l59_c3_196b_return_output;
     VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_pixel_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l154_c3_6933_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_sprite_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_7398_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_cond;
     is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output := is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_cond;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output := result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- pixel_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_pixel_MUX_uxn_device_h_l42_c2_241f_cond;
     pixel_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iftrue;
     pixel_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_pixel_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l42_c2_241f_return_output := pixel_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output := auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- x_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_x_MUX_uxn_device_h_l99_c7_6643_cond;
     x_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_6643_iftrue;
     x_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_6643_return_output := x_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l146_c3_6f3c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_cond;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output := result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output;

     -- y_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_y_MUX_uxn_device_h_l130_c7_3898_cond;
     y_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_3898_iftrue;
     y_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_3898_return_output := y_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_cond;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output := result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- result_vram_address_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_cond;
     result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iftrue;
     result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output := result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- sprite_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_cond;
     sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_return_output := sprite_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_vram_value_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_cond;
     result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iftrue;
     result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output := result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- color_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_color_MUX_uxn_device_h_l42_c2_241f_cond;
     color_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_color_MUX_uxn_device_h_l42_c2_241f_iftrue;
     color_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_color_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l42_c2_241f_return_output := color_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_7398_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l58_c7_58e6_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_6f3c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_sprite_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_3898_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_cond;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output := result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- sprite_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_cond;
     sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_return_output := sprite_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- x_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_x_MUX_uxn_device_h_l90_c7_1531_cond;
     x_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_1531_iftrue;
     x_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_1531_return_output := x_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_cond;
     is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output := is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- result_vram_value_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_cond;
     result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iftrue;
     result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output := result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- result_vram_address_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_cond;
     result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iftrue;
     result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output := result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- y_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_y_MUX_uxn_device_h_l121_c7_77ac_cond;
     y_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_y_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     y_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_y_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l121_c7_77ac_return_output := y_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output := auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_cond;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output := result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_sprite_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_y_MUX_uxn_device_h_l121_c7_77ac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_cond;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output := result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- y_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_y_MUX_uxn_device_h_l114_c7_bc8e_cond;
     y_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     y_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_bc8e_return_output := y_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- x_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_x_MUX_uxn_device_h_l83_c7_8a82_cond;
     x_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_x_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     x_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_x_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l83_c7_8a82_return_output := x_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_vram_address_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_cond;
     result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iftrue;
     result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output := result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- auto_advance_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_cond;
     auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output := auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- result_vram_value_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_cond;
     result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iftrue;
     result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output := result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_cond;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output := result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_cond;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output := result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- sprite_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_sprite_MUX_uxn_device_h_l42_c2_241f_cond;
     sprite_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iftrue;
     sprite_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_sprite_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l42_c2_241f_return_output := sprite_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_cond;
     is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iftrue;
     is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output := is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l121_c7_77ac_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l130_c7_3898_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_x_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     -- x_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_x_MUX_uxn_device_h_l75_c7_6521_cond;
     x_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_x_MUX_uxn_device_h_l75_c7_6521_iftrue;
     x_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_x_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c7_6521_return_output := x_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_cond;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output := result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_cond;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output := result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- y_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_y_MUX_uxn_device_h_l106_c7_c1de_cond;
     y_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     y_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_c1de_return_output := y_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- result_vram_address_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_cond;
     result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iftrue;
     result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output := result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_cond;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output := result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_vram_value_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_cond;
     result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output := result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output := auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_x_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_c1de_return_output;
     -- result_vram_value_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_cond;
     result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output := result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_cond;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output := result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- x_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_x_MUX_uxn_device_h_l68_c7_caa0_cond;
     x_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_x_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     x_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_x_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l68_c7_caa0_return_output := x_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_cond;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output := result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- result_vram_address_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_cond;
     result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output := result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output := auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_cond;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output := result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- y_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_y_MUX_uxn_device_h_l99_c7_6643_cond;
     y_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_6643_iftrue;
     y_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_6643_return_output := y_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_x_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_x_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_6643_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_cond;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output := result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output := auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- result_vram_address_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_cond;
     result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output := result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- x_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_x_MUX_uxn_device_h_l58_c7_58e6_cond;
     x_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_x_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     x_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_x_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l58_c7_58e6_return_output := x_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_vram_value_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_cond;
     result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output := result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_bc8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_cond;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output := result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- y_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_y_MUX_uxn_device_h_l90_c7_1531_cond;
     y_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_1531_iftrue;
     y_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_1531_return_output := y_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l114_c7_bc8e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_x_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_x_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_1531_return_output;
     -- y_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_y_MUX_uxn_device_h_l83_c7_8a82_cond;
     y_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_y_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     y_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_y_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l83_c7_8a82_return_output := y_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_cond;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output := result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_77ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output := auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_vram_address_MUX[uxn_device_h_l106_c7_c1de] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_cond;
     result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iftrue;
     result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output := result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output;

     -- x_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_x_MUX_uxn_device_h_l51_c7_74f9_cond;
     x_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_x_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     x_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_x_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l51_c7_74f9_return_output := x_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_77ac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l106_c7_c1de_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_x_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_x_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_y_MUX_uxn_device_h_l83_c7_8a82_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_3898] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- x_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_x_MUX_uxn_device_h_l42_c2_241f_cond;
     x_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_x_MUX_uxn_device_h_l42_c2_241f_iftrue;
     x_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_x_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l42_c2_241f_return_output := x_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- auto_advance_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_cond;
     auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output := auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- y_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_y_MUX_uxn_device_h_l75_c7_6521_cond;
     y_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_y_MUX_uxn_device_h_l75_c7_6521_iftrue;
     y_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_y_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c7_6521_return_output := y_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_cond;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output := result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_vram_value_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_cond;
     result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iftrue;
     result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output := result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_6643] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_3898_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_auto_advance_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6643_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l90_c7_1531_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_y_MUX_uxn_device_h_l75_c7_6521_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_cond;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output := result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_vram_value_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_cond;
     result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output := result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- auto_advance_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_cond;
     auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iftrue;
     auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output := auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_cond;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output := result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_7398] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_1531] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output;

     -- y_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_y_MUX_uxn_device_h_l68_c7_caa0_cond;
     y_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_y_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     y_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_y_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l68_c7_caa0_return_output := y_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_7398_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_1531_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_y_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_y_MUX_uxn_device_h_l68_c7_caa0_return_output;
     -- result_vram_value_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_cond;
     result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iftrue;
     result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output := result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- auto_advance_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_cond;
     auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output := auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_cond;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output := result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- result_vram_address_MUX[uxn_device_h_l83_c7_8a82] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_cond;
     result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iftrue;
     result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output := result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_67db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_cond;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output := result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_cond;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output := result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- y_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_y_MUX_uxn_device_h_l58_c7_58e6_cond;
     y_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_y_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     y_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_y_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l58_c7_58e6_return_output := y_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_67db_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8a82_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_y_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_y_MUX_uxn_device_h_l58_c7_58e6_return_output;
     -- y_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_y_MUX_uxn_device_h_l51_c7_74f9_cond;
     y_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_y_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     y_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_y_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l51_c7_74f9_return_output := y_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_f295] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_cond;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output := result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- result_vram_address_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_cond;
     result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iftrue;
     result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output := result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_cond;
     result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output := result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l75_c7_6521] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_cond;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output := result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output;

     -- auto_advance_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_cond;
     auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output := auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_vram_value_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_cond;
     result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output := result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_f295_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l75_c7_6521_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_y_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_y_MUX_uxn_device_h_l51_c7_74f9_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_cond;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output := result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_3226] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_cond;
     result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output := result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- y_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_y_MUX_uxn_device_h_l42_c2_241f_cond;
     y_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_y_MUX_uxn_device_h_l42_c2_241f_iftrue;
     y_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_y_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l42_c2_241f_return_output := y_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_cond;
     result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output := result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_vram_address_MUX[uxn_device_h_l68_c7_caa0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_cond;
     result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iftrue;
     result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output := result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_cond;
     result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output := result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- auto_advance_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_cond;
     auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output := auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_3226_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l68_c7_caa0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l58_c7_58e6_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l42_c2_241f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_94c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output;

     -- auto_advance_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_cond;
     auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iftrue;
     auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output := auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_cond;
     result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output := result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_cond;
     result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output := result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l58_c7_58e6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_cond;
     result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output := result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output;

     -- result_vram_value_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_cond;
     result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output := result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_94c0_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l42_c2_241f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l58_c7_58e6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l51_c7_74f9_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_cond;
     result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output := result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- printf_uxn_device_h_l155_c4_9bda[uxn_device_h_l155_c4_9bda] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0 <= VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg0;
     printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1 <= VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg1;
     printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2 <= VAR_printf_uxn_device_h_l155_c4_9bda_uxn_device_h_l155_c4_9bda_arg2;
     -- Outputs

     -- result_vram_address_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_cond;
     result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output := result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- result_vram_value_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_cond;
     result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output := result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l51_c7_74f9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_cond;
     result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output := result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l51_c7_74f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l51_c7_74f9_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l42_c2_241f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_cond;
     result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iftrue;
     result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output := result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_d97c_uxn_device_h_l179_l33_DUPLICATE_eca5 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d97c_uxn_device_h_l179_l33_DUPLICATE_eca5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d97c(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_241f_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l42_c2_241f_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_241f_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_241f_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_241f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_241f_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d97c_uxn_device_h_l179_l33_DUPLICATE_eca5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d97c_uxn_device_h_l179_l33_DUPLICATE_eca5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ctrl_none <= REG_VAR_ctrl_none;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_pixel <= REG_VAR_pixel;
REG_COMB_sprite <= REG_VAR_sprite;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_fill_mode <= REG_VAR_is_fill_mode;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ctrl_none <= REG_COMB_ctrl_none;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     pixel <= REG_COMB_pixel;
     sprite <= REG_COMB_sprite;
     auto_advance <= REG_COMB_auto_advance;
     color <= REG_COMB_color;
     is_fill_mode <= REG_COMB_is_fill_mode;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
