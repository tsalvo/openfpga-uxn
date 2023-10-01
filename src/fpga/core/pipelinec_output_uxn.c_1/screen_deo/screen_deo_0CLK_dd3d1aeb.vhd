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
-- Submodules: 275
entity screen_deo_0CLK_dd3d1aeb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_dd3d1aeb;
architecture arch of screen_deo_0CLK_dd3d1aeb is
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
is_device_ram_read => to_unsigned(0, 1),
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
-- printf_uxn_device_h_l33_c2_eeb5[uxn_device_h_l33_c2_eeb5]
signal printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_4636]
signal BIN_OP_EQ_uxn_device_h_l35_c6_4636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_4636_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_6a5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l35_c2_e222]
signal y_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_e222]
signal auto_advance_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l35_c2_e222]
signal color_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_e222]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_e222]
signal sprite_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_e222]
signal pixel_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l35_c2_e222]
signal x_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_e222]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_e222]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_e222]
signal result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_e222]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_e222]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_e222]
signal result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_e222]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_8b06]
signal BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_81e6]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_81e6]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_81e6]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_81e6]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_8b88]
signal BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_4e2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l45_c7_6a5d]
signal y_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_6a5d]
signal auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l45_c7_6a5d]
signal color_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_6a5d]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_6a5d]
signal sprite_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_6a5d]
signal pixel_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l45_c7_6a5d]
signal x_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_6a5d]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_6a5d]
signal result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_6a5d]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_6a5d]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_6a5d]
signal result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_6a5d]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_424c]
signal BIN_OP_EQ_uxn_device_h_l46_c7_424c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_424c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_1ab3]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_1ab3]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_1ab3]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_b1fc]
signal BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2628]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l53_c7_4e2d]
signal y_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_4e2d]
signal auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l53_c7_4e2d]
signal color_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_4e2d]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_4e2d]
signal sprite_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_4e2d]
signal pixel_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l53_c7_4e2d]
signal x_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_4e2d]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_4e2d]
signal result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_4e2d]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_4e2d]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_4e2d]
signal result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_4e2d]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_676a]
signal BIN_OP_EQ_uxn_device_h_l54_c7_676a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_676a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_0281]
signal color_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_0281]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_0281]
signal pixel_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_0281]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_0281]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_0281]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_3f65]
signal BIN_OP_AND_uxn_device_h_l57_c20_3f65_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_3f65_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_7e64]
signal BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_0738]
signal MUX_uxn_device_h_l57_c20_0738_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0738_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0738_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0738_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_30a3]
signal BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_3f25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l64_c7_2628]
signal y_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_2628]
signal auto_advance_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_2628]
signal sprite_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l64_c7_2628]
signal x_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_2628]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_2628]
signal result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_2628]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_2628]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_2628]
signal result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2628]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_a99d]
signal BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_fb68]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_fb68]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_fb68]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_94b8]
signal BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_b786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l72_c7_3f25]
signal y_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_3f25]
signal auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_3f25]
signal sprite_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l72_c7_3f25]
signal x_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_3f25]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_3f25]
signal result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_3f25]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_3f25]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_3f25]
signal result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_3f25]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_e781]
signal BIN_OP_EQ_uxn_device_h_l73_c7_e781_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_e781_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_608b]
signal sprite_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_608b]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_608b]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_608b]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_7846]
signal BIN_OP_EQ_uxn_device_h_l81_c11_7846_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_7846_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_865f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l81_c7_b786]
signal y_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_b786]
signal auto_advance_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_b786]
signal x_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_b786]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_b786]
signal result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_b786]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_b786]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_b786]
signal result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_b786]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_f871]
signal BIN_OP_EQ_uxn_device_h_l82_c7_f871_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_f871_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_0532]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_0532]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_0532]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_8f8b]
signal BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_93ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l89_c7_865f]
signal y_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_865f]
signal auto_advance_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l89_c7_865f]
signal x_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_865f]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_865f]
signal result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_865f]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_865f]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_865f]
signal result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_865f]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_2af7]
signal BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c3_0384]
signal x_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_0384]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_0384]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_0384]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_1e37]
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_c9d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l99_c7_93ec]
signal y_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_93ec]
signal auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c7_93ec]
signal x_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_93ec]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_93ec]
signal result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_93ec]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_93ec]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_93ec]
signal result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_93ec]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_b34e]
signal BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_4f17]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_4f17]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_4f17]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_2ccd]
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_8845]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l107_c7_c9d2]
signal y_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_c9d2]
signal auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c7_c9d2]
signal x_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_c9d2]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_c9d2]
signal result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_c9d2]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_c9d2]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_c9d2]
signal result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_c9d2]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_44ad]
signal BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c3_7fb3]
signal x_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_7fb3]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_7fb3]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_7fb3]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_8444]
signal BIN_OP_OR_uxn_device_h_l109_c4_8444_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_8444_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_e1e8]
signal BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_40bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l116_c7_8845]
signal y_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_8845]
signal auto_advance_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_8845]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_8845]
signal result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_8845]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_8845]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_8845]
signal result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_8845]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_b395]
signal BIN_OP_EQ_uxn_device_h_l117_c7_b395_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_b395_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_d1d3]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_d1d3]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_d1d3]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_f056]
signal BIN_OP_EQ_uxn_device_h_l124_c11_f056_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_f056_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_c5cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c7_40bf]
signal y_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_40bf]
signal auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_40bf]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_40bf]
signal result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_40bf]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_40bf]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_40bf]
signal result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_40bf]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_ecec]
signal BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_9e7a]
signal y_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_9e7a]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_9e7a]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_9e7a]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_59ac]
signal BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_863a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l134_c7_c5cf]
signal y_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_c5cf]
signal auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_c5cf]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_c5cf]
signal result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_c5cf]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_c5cf]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_c5cf]
signal result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_c5cf]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_1286]
signal BIN_OP_EQ_uxn_device_h_l135_c7_1286_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_1286_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_3390]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_3390]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_3390]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_bf8a]
signal BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_b569]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l142_c7_863a]
signal y_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_863a]
signal auto_advance_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_863a]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_863a]
signal result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_863a]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_863a]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_863a]
signal result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_863a]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_80f3]
signal BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_5426]
signal y_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_5426]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_5426]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_5426]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_d40d]
signal BIN_OP_OR_uxn_device_h_l144_c4_d40d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_d40d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_42fd]
signal BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_1b67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_b569]
signal auto_advance_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_b569]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_b569]
signal result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_b569]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_b569]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_b569]
signal result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_b569]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_c499]
signal BIN_OP_EQ_uxn_device_h_l152_c7_c499_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_c499_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_946f]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_946f]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_946f]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_7a5a]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_36f9]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_1e31]
signal BIN_OP_GT_uxn_device_h_l153_c27_1e31_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_1e31_right : unsigned(16 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_21bd]
signal MUX_uxn_device_h_l153_c27_21bd_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_21bd_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_21bd_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_21bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_c50c]
signal BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_58ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_1b67]
signal auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_1b67]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_1b67]
signal result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_1b67]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_1b67]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_1b67]
signal result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_1b67]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_f252]
signal BIN_OP_EQ_uxn_device_h_l161_c7_f252_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_f252_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_6536]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_8f59]
signal auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_8f59]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_8f59]
signal result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_8f59]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_8f59]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_8f59]
signal result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_8f59]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);

-- printf_uxn_device_h_l162_c4_3c70[uxn_device_h_l162_c4_3c70]
signal printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_6a98]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_ab44]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_0f15]
signal BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_8930]
signal result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_8930]
signal result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_8930]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_8930]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_b9a7]
signal BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_6cdd]
signal result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_6cdd]
signal result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_6cdd]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_2136( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_device_ram_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5
printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5 : entity work.printf_uxn_device_h_l33_c2_eeb5_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0,
printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_4636
BIN_OP_EQ_uxn_device_h_l35_c6_4636 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_4636_left,
BIN_OP_EQ_uxn_device_h_l35_c6_4636_right,
BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- y_MUX_uxn_device_h_l35_c2_e222
y_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_e222_cond,
y_MUX_uxn_device_h_l35_c2_e222_iftrue,
y_MUX_uxn_device_h_l35_c2_e222_iffalse,
y_MUX_uxn_device_h_l35_c2_e222_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_e222
auto_advance_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_e222_cond,
auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output);

-- color_MUX_uxn_device_h_l35_c2_e222
color_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_e222_cond,
color_MUX_uxn_device_h_l35_c2_e222_iftrue,
color_MUX_uxn_device_h_l35_c2_e222_iffalse,
color_MUX_uxn_device_h_l35_c2_e222_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_e222
is_fill_mode_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_e222
sprite_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_e222_cond,
sprite_MUX_uxn_device_h_l35_c2_e222_iftrue,
sprite_MUX_uxn_device_h_l35_c2_e222_iffalse,
sprite_MUX_uxn_device_h_l35_c2_e222_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_e222
pixel_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_e222_cond,
pixel_MUX_uxn_device_h_l35_c2_e222_iftrue,
pixel_MUX_uxn_device_h_l35_c2_e222_iffalse,
pixel_MUX_uxn_device_h_l35_c2_e222_return_output);

-- x_MUX_uxn_device_h_l35_c2_e222
x_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_e222_cond,
x_MUX_uxn_device_h_l35_c2_e222_iftrue,
x_MUX_uxn_device_h_l35_c2_e222_iffalse,
x_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_e222
result_is_deo_done_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_e222
result_vram_value_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_e222
result_is_vram_write_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_e222
result_device_ram_address_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_e222
result_vram_address_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_8b06
BIN_OP_EQ_uxn_device_h_l36_c7_8b06 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left,
BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right,
BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6
result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6
result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_8b88
BIN_OP_EQ_uxn_device_h_l45_c11_8b88 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left,
BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right,
BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- y_MUX_uxn_device_h_l45_c7_6a5d
y_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_6a5d_cond,
y_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
y_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
y_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_6a5d
auto_advance_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond,
auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- color_MUX_uxn_device_h_l45_c7_6a5d
color_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_6a5d_cond,
color_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
color_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
color_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d
is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_6a5d
sprite_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_6a5d_cond,
sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_6a5d
pixel_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_6a5d_cond,
pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- x_MUX_uxn_device_h_l45_c7_6a5d
x_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_6a5d_cond,
x_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
x_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
x_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d
result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_6a5d
result_vram_value_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d
result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d
result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_6a5d
result_vram_address_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_424c
BIN_OP_EQ_uxn_device_h_l46_c7_424c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_424c_left,
BIN_OP_EQ_uxn_device_h_l46_c7_424c_right,
BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3
result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3
result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_b1fc
BIN_OP_EQ_uxn_device_h_l53_c11_b1fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left,
BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right,
BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output);

-- y_MUX_uxn_device_h_l53_c7_4e2d
y_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_4e2d_cond,
y_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
y_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
y_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_4e2d
auto_advance_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond,
auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- color_MUX_uxn_device_h_l53_c7_4e2d
color_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_4e2d_cond,
color_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
color_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
color_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d
is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_4e2d
sprite_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_4e2d_cond,
sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_4e2d
pixel_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_4e2d_cond,
pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- x_MUX_uxn_device_h_l53_c7_4e2d
x_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_4e2d_cond,
x_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
x_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
x_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d
result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_4e2d
result_vram_value_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d
result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d
result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_4e2d
result_vram_address_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_676a
BIN_OP_EQ_uxn_device_h_l54_c7_676a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_676a_left,
BIN_OP_EQ_uxn_device_h_l54_c7_676a_right,
BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output);

-- color_MUX_uxn_device_h_l54_c3_0281
color_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_0281_cond,
color_MUX_uxn_device_h_l54_c3_0281_iftrue,
color_MUX_uxn_device_h_l54_c3_0281_iffalse,
color_MUX_uxn_device_h_l54_c3_0281_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_0281
is_fill_mode_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_0281
pixel_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_0281_cond,
pixel_MUX_uxn_device_h_l54_c3_0281_iftrue,
pixel_MUX_uxn_device_h_l54_c3_0281_iffalse,
pixel_MUX_uxn_device_h_l54_c3_0281_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_0281
result_is_deo_done_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_0281
result_device_ram_address_MUX_uxn_device_h_l54_c3_0281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_3f65
BIN_OP_AND_uxn_device_h_l57_c20_3f65 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_3f65_left,
BIN_OP_AND_uxn_device_h_l57_c20_3f65_right,
BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_7e64
BIN_OP_EQ_uxn_device_h_l57_c20_7e64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left,
BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right,
BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output);

-- MUX_uxn_device_h_l57_c20_0738
MUX_uxn_device_h_l57_c20_0738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_0738_cond,
MUX_uxn_device_h_l57_c20_0738_iftrue,
MUX_uxn_device_h_l57_c20_0738_iffalse,
MUX_uxn_device_h_l57_c20_0738_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_30a3
BIN_OP_EQ_uxn_device_h_l64_c11_30a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left,
BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right,
BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- y_MUX_uxn_device_h_l64_c7_2628
y_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_2628_cond,
y_MUX_uxn_device_h_l64_c7_2628_iftrue,
y_MUX_uxn_device_h_l64_c7_2628_iffalse,
y_MUX_uxn_device_h_l64_c7_2628_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_2628
auto_advance_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_2628_cond,
auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_2628
sprite_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_2628_cond,
sprite_MUX_uxn_device_h_l64_c7_2628_iftrue,
sprite_MUX_uxn_device_h_l64_c7_2628_iffalse,
sprite_MUX_uxn_device_h_l64_c7_2628_return_output);

-- x_MUX_uxn_device_h_l64_c7_2628
x_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_2628_cond,
x_MUX_uxn_device_h_l64_c7_2628_iftrue,
x_MUX_uxn_device_h_l64_c7_2628_iffalse,
x_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_2628
result_is_deo_done_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_2628
result_vram_value_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_2628
result_is_vram_write_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_2628
result_device_ram_address_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_2628
result_vram_address_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_a99d
BIN_OP_EQ_uxn_device_h_l65_c7_a99d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left,
BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right,
BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_94b8
BIN_OP_EQ_uxn_device_h_l72_c11_94b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left,
BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right,
BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output);

-- y_MUX_uxn_device_h_l72_c7_3f25
y_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_3f25_cond,
y_MUX_uxn_device_h_l72_c7_3f25_iftrue,
y_MUX_uxn_device_h_l72_c7_3f25_iffalse,
y_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_3f25
auto_advance_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond,
auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_3f25
sprite_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_3f25_cond,
sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue,
sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse,
sprite_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- x_MUX_uxn_device_h_l72_c7_3f25
x_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_3f25_cond,
x_MUX_uxn_device_h_l72_c7_3f25_iftrue,
x_MUX_uxn_device_h_l72_c7_3f25_iffalse,
x_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25
result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_3f25
result_vram_value_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25
result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25
result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_3f25
result_vram_address_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_e781
BIN_OP_EQ_uxn_device_h_l73_c7_e781 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_e781_left,
BIN_OP_EQ_uxn_device_h_l73_c7_e781_right,
BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_608b
sprite_MUX_uxn_device_h_l73_c3_608b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_608b_cond,
sprite_MUX_uxn_device_h_l73_c3_608b_iftrue,
sprite_MUX_uxn_device_h_l73_c3_608b_iffalse,
sprite_MUX_uxn_device_h_l73_c3_608b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_608b
result_is_deo_done_MUX_uxn_device_h_l73_c3_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_608b
result_device_ram_address_MUX_uxn_device_h_l73_c3_608b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_7846
BIN_OP_EQ_uxn_device_h_l81_c11_7846 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_7846_left,
BIN_OP_EQ_uxn_device_h_l81_c11_7846_right,
BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output);

-- y_MUX_uxn_device_h_l81_c7_b786
y_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_b786_cond,
y_MUX_uxn_device_h_l81_c7_b786_iftrue,
y_MUX_uxn_device_h_l81_c7_b786_iffalse,
y_MUX_uxn_device_h_l81_c7_b786_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_b786
auto_advance_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_b786_cond,
auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output);

-- x_MUX_uxn_device_h_l81_c7_b786
x_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_b786_cond,
x_MUX_uxn_device_h_l81_c7_b786_iftrue,
x_MUX_uxn_device_h_l81_c7_b786_iffalse,
x_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_b786
result_is_deo_done_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_b786
result_vram_value_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_b786
result_is_vram_write_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_b786
result_device_ram_address_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_b786
result_vram_address_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_f871
BIN_OP_EQ_uxn_device_h_l82_c7_f871 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_f871_left,
BIN_OP_EQ_uxn_device_h_l82_c7_f871_right,
BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_0532
result_is_deo_done_MUX_uxn_device_h_l82_c3_0532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_0532
result_device_ram_address_MUX_uxn_device_h_l82_c3_0532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_8f8b
BIN_OP_EQ_uxn_device_h_l89_c11_8f8b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left,
BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right,
BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- y_MUX_uxn_device_h_l89_c7_865f
y_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_865f_cond,
y_MUX_uxn_device_h_l89_c7_865f_iftrue,
y_MUX_uxn_device_h_l89_c7_865f_iffalse,
y_MUX_uxn_device_h_l89_c7_865f_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_865f
auto_advance_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_865f_cond,
auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output);

-- x_MUX_uxn_device_h_l89_c7_865f
x_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_865f_cond,
x_MUX_uxn_device_h_l89_c7_865f_iftrue,
x_MUX_uxn_device_h_l89_c7_865f_iffalse,
x_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_865f
result_is_deo_done_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_865f
result_vram_value_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_865f
result_is_vram_write_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_865f
result_device_ram_address_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_865f
result_vram_address_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_2af7
BIN_OP_EQ_uxn_device_h_l90_c7_2af7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left,
BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right,
BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output);

-- x_MUX_uxn_device_h_l90_c3_0384
x_MUX_uxn_device_h_l90_c3_0384 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_0384_cond,
x_MUX_uxn_device_h_l90_c3_0384_iftrue,
x_MUX_uxn_device_h_l90_c3_0384_iffalse,
x_MUX_uxn_device_h_l90_c3_0384_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_0384
result_is_deo_done_MUX_uxn_device_h_l90_c3_0384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_0384
result_device_ram_address_MUX_uxn_device_h_l90_c3_0384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_1e37
BIN_OP_EQ_uxn_device_h_l99_c11_1e37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left,
BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right,
BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- y_MUX_uxn_device_h_l99_c7_93ec
y_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_93ec_cond,
y_MUX_uxn_device_h_l99_c7_93ec_iftrue,
y_MUX_uxn_device_h_l99_c7_93ec_iffalse,
y_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_93ec
auto_advance_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond,
auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- x_MUX_uxn_device_h_l99_c7_93ec
x_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_93ec_cond,
x_MUX_uxn_device_h_l99_c7_93ec_iftrue,
x_MUX_uxn_device_h_l99_c7_93ec_iffalse,
x_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec
result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_93ec
result_vram_value_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec
result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec
result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_93ec
result_vram_address_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_b34e
BIN_OP_EQ_uxn_device_h_l100_c7_b34e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left,
BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right,
BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17
result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17
result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_2ccd
BIN_OP_EQ_uxn_device_h_l107_c11_2ccd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left,
BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right,
BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output);

-- y_MUX_uxn_device_h_l107_c7_c9d2
y_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_c9d2_cond,
y_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
y_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
y_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_c9d2
auto_advance_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond,
auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- x_MUX_uxn_device_h_l107_c7_c9d2
x_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_c9d2_cond,
x_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
x_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
x_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2
result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_c9d2
result_vram_value_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2
result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2
result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_c9d2
result_vram_address_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_44ad
BIN_OP_EQ_uxn_device_h_l108_c7_44ad : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left,
BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right,
BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output);

-- x_MUX_uxn_device_h_l108_c3_7fb3
x_MUX_uxn_device_h_l108_c3_7fb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_7fb3_cond,
x_MUX_uxn_device_h_l108_c3_7fb3_iftrue,
x_MUX_uxn_device_h_l108_c3_7fb3_iffalse,
x_MUX_uxn_device_h_l108_c3_7fb3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3
result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3
result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_8444
BIN_OP_OR_uxn_device_h_l109_c4_8444 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_8444_left,
BIN_OP_OR_uxn_device_h_l109_c4_8444_right,
BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_e1e8
BIN_OP_EQ_uxn_device_h_l116_c11_e1e8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left,
BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right,
BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- y_MUX_uxn_device_h_l116_c7_8845
y_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_8845_cond,
y_MUX_uxn_device_h_l116_c7_8845_iftrue,
y_MUX_uxn_device_h_l116_c7_8845_iffalse,
y_MUX_uxn_device_h_l116_c7_8845_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_8845
auto_advance_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_8845_cond,
auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_8845
result_is_deo_done_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_8845
result_vram_value_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_8845
result_is_vram_write_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_8845
result_device_ram_address_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_8845
result_vram_address_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_b395
BIN_OP_EQ_uxn_device_h_l117_c7_b395 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_b395_left,
BIN_OP_EQ_uxn_device_h_l117_c7_b395_right,
BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3
result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3
result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_f056
BIN_OP_EQ_uxn_device_h_l124_c11_f056 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_f056_left,
BIN_OP_EQ_uxn_device_h_l124_c11_f056_right,
BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- y_MUX_uxn_device_h_l124_c7_40bf
y_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_40bf_cond,
y_MUX_uxn_device_h_l124_c7_40bf_iftrue,
y_MUX_uxn_device_h_l124_c7_40bf_iffalse,
y_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_40bf
auto_advance_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond,
auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf
result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_40bf
result_vram_value_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf
result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf
result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_40bf
result_vram_address_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_ecec
BIN_OP_EQ_uxn_device_h_l125_c7_ecec : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left,
BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right,
BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output);

-- y_MUX_uxn_device_h_l125_c3_9e7a
y_MUX_uxn_device_h_l125_c3_9e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_9e7a_cond,
y_MUX_uxn_device_h_l125_c3_9e7a_iftrue,
y_MUX_uxn_device_h_l125_c3_9e7a_iffalse,
y_MUX_uxn_device_h_l125_c3_9e7a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a
result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a
result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_59ac
BIN_OP_EQ_uxn_device_h_l134_c11_59ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left,
BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right,
BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output);

-- y_MUX_uxn_device_h_l134_c7_c5cf
y_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_c5cf_cond,
y_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
y_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
y_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_c5cf
auto_advance_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond,
auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf
result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_c5cf
result_vram_value_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf
result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf
result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_c5cf
result_vram_address_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_1286
BIN_OP_EQ_uxn_device_h_l135_c7_1286 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_1286_left,
BIN_OP_EQ_uxn_device_h_l135_c7_1286_right,
BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_3390
result_is_deo_done_MUX_uxn_device_h_l135_c3_3390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_3390
result_device_ram_address_MUX_uxn_device_h_l135_c3_3390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_bf8a
BIN_OP_EQ_uxn_device_h_l142_c11_bf8a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left,
BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right,
BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output);

-- y_MUX_uxn_device_h_l142_c7_863a
y_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_863a_cond,
y_MUX_uxn_device_h_l142_c7_863a_iftrue,
y_MUX_uxn_device_h_l142_c7_863a_iffalse,
y_MUX_uxn_device_h_l142_c7_863a_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_863a
auto_advance_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_863a_cond,
auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_863a
result_is_deo_done_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_863a
result_vram_value_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_863a
result_is_vram_write_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_863a
result_device_ram_address_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_863a
result_vram_address_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_80f3
BIN_OP_EQ_uxn_device_h_l143_c7_80f3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left,
BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right,
BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output);

-- y_MUX_uxn_device_h_l143_c3_5426
y_MUX_uxn_device_h_l143_c3_5426 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_5426_cond,
y_MUX_uxn_device_h_l143_c3_5426_iftrue,
y_MUX_uxn_device_h_l143_c3_5426_iffalse,
y_MUX_uxn_device_h_l143_c3_5426_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_5426
result_is_deo_done_MUX_uxn_device_h_l143_c3_5426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_5426
result_device_ram_address_MUX_uxn_device_h_l143_c3_5426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_d40d
BIN_OP_OR_uxn_device_h_l144_c4_d40d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_d40d_left,
BIN_OP_OR_uxn_device_h_l144_c4_d40d_right,
BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_42fd
BIN_OP_EQ_uxn_device_h_l151_c11_42fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left,
BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right,
BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_b569
auto_advance_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_b569_cond,
auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_b569
result_is_deo_done_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_b569
result_vram_value_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_b569
result_is_vram_write_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_b569
result_device_ram_address_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_b569
result_vram_address_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_c499
BIN_OP_EQ_uxn_device_h_l152_c7_c499 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_c499_left,
BIN_OP_EQ_uxn_device_h_l152_c7_c499_right,
BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_946f
result_is_deo_done_MUX_uxn_device_h_l152_c3_946f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_946f
result_device_ram_address_MUX_uxn_device_h_l152_c3_946f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_36f9
BIN_OP_PLUS_uxn_device_h_l153_c27_36f9 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_1e31
BIN_OP_GT_uxn_device_h_l153_c27_1e31 : entity work.BIN_OP_GT_uint26_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_1e31_left,
BIN_OP_GT_uxn_device_h_l153_c27_1e31_right,
BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output);

-- MUX_uxn_device_h_l153_c27_21bd
MUX_uxn_device_h_l153_c27_21bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_21bd_cond,
MUX_uxn_device_h_l153_c27_21bd_iftrue,
MUX_uxn_device_h_l153_c27_21bd_iffalse,
MUX_uxn_device_h_l153_c27_21bd_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_c50c
BIN_OP_EQ_uxn_device_h_l160_c11_c50c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left,
BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right,
BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_1b67
auto_advance_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond,
auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67
result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_1b67
result_vram_value_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67
result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67
result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_1b67
result_vram_address_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_f252
BIN_OP_EQ_uxn_device_h_l161_c7_f252 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_f252_left,
BIN_OP_EQ_uxn_device_h_l161_c7_f252_right,
BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_8f59
auto_advance_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond,
auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59
result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_8f59
result_vram_value_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59
result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59
result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_8f59
result_vram_address_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output);

-- printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70
printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70 : entity work.printf_uxn_device_h_l162_c4_3c70_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0,
printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1,
printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_ab44
BIN_OP_PLUS_uxn_device_h_l167_c27_ab44 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_0f15
BIN_OP_EQ_uxn_device_h_l173_c11_0f15 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left,
BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right,
BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_8930
result_vram_address_MUX_uxn_device_h_l173_c7_8930 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_8930
result_vram_value_MUX_uxn_device_h_l173_c7_8930 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_8930
result_is_deo_done_MUX_uxn_device_h_l173_c7_8930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_8930
result_is_vram_write_MUX_uxn_device_h_l173_c7_8930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_b9a7
BIN_OP_EQ_uxn_device_h_l174_c7_b9a7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left,
BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right,
BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_6cdd
result_vram_address_MUX_uxn_device_h_l174_c3_6cdd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_6cdd
result_vram_value_MUX_uxn_device_h_l174_c3_6cdd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd
result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x,
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 y_MUX_uxn_device_h_l35_c2_e222_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output,
 color_MUX_uxn_device_h_l35_c2_e222_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output,
 sprite_MUX_uxn_device_h_l35_c2_e222_return_output,
 pixel_MUX_uxn_device_h_l35_c2_e222_return_output,
 x_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 y_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 color_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 x_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output,
 y_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 color_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 x_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output,
 color_MUX_uxn_device_h_l54_c3_0281_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output,
 pixel_MUX_uxn_device_h_l54_c3_0281_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output,
 MUX_uxn_device_h_l57_c20_0738_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output,
 y_MUX_uxn_device_h_l64_c7_2628_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output,
 sprite_MUX_uxn_device_h_l64_c7_2628_return_output,
 x_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output,
 y_MUX_uxn_device_h_l72_c7_3f25_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output,
 sprite_MUX_uxn_device_h_l72_c7_3f25_return_output,
 x_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output,
 sprite_MUX_uxn_device_h_l73_c3_608b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output,
 y_MUX_uxn_device_h_l81_c7_b786_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output,
 x_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output,
 y_MUX_uxn_device_h_l89_c7_865f_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output,
 x_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output,
 x_MUX_uxn_device_h_l90_c3_0384_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 y_MUX_uxn_device_h_l99_c7_93ec_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output,
 x_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output,
 y_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 x_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output,
 x_MUX_uxn_device_h_l108_c3_7fb3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output,
 y_MUX_uxn_device_h_l116_c7_8845_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 y_MUX_uxn_device_h_l124_c7_40bf_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output,
 y_MUX_uxn_device_h_l125_c3_9e7a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output,
 y_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output,
 y_MUX_uxn_device_h_l142_c7_863a_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output,
 y_MUX_uxn_device_h_l143_c3_5426_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output,
 MUX_uxn_device_h_l153_c27_21bd_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_58a6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_ec50 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_a568 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_6846_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0738_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0738_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0738_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0738_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_e213 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_e58c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_3e9c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_0010 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_2e3d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_56d0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_6b77 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_23a9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_233b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_6968 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_fcf3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_21bd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_21bd_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_21bd_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_21bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_1ecd : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_ace6 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_01e5_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_cc62_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_8213_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_e3ef : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_966a : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_625c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_2136_uxn_device_h_l187_l26_DUPLICATE_d0c6_return_output : device_out_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l178_c4_966a := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_966a;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_e213 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_e213;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_6b77 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_6b77;
     VAR_result_device_ram_address_uxn_device_h_l146_c4_6968 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_6968;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_right := to_unsigned(128, 8);
     VAR_result_device_ram_address_uxn_device_h_l137_c4_233b := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_233b;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l57_c20_0738_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_56d0 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_56d0;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_0010 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_0010;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right := to_unsigned(15, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_1ecd := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_1ecd;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_ec50 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_ec50;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right := to_unsigned(320, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse := to_unsigned(0, 1);
     VAR_result_vram_address_uxn_device_h_l177_c4_e3ef := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_e3ef;
     VAR_MUX_uxn_device_h_l153_c27_21bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_right := to_unsigned(76799, 17);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_23a9 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_23a9;
     VAR_result_device_ram_address_uxn_device_h_l76_c4_e58c := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_e58c;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right := to_unsigned(9, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right := to_unsigned(320, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l153_c27_21bd_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_2e3d := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_2e3d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_a568 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_a568;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_right := to_unsigned(10, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_3e9c := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_3e9c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l57_c20_0738_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_58a6 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_58a6;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_fcf3 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_fcf3;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right := to_unsigned(14, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_e222_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_0281_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right := x;
     VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_e222_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_2628_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_3f25_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_b786_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_0384_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_93ec_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_left := y;
     VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_8845_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_863a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_5426_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_e222_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_2628_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_3f25_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_b786_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_865f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_93ec_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l46_c7_424c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_424c_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_424c_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l64_c11_30a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_f056] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_f056_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_f056_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c7_e781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_e781_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_e781_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output;

     -- printf_uxn_device_h_l33_c2_eeb5[uxn_device_h_l33_c2_eeb5] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0 <= VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg0;
     printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1 <= VAR_printf_uxn_device_h_l33_c2_eeb5_uxn_device_h_l33_c2_eeb5_arg1;
     -- Outputs

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_b9a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_cc62] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_cc62_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_1e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c7_44ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_b34e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_e1e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_2af7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_625c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_625c_return_output := result.is_device_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l125_c7_ecec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_7846] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_7846_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_7846_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_1286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_1286_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_1286_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_8213] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_8213_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l89_c11_8f8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l173_c11_0f15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_c499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_c499_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_c499_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_f252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_f252_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_f252_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_3f65] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_3f65_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_left;
     BIN_OP_AND_uxn_device_h_l57_c20_3f65_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output := BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_676a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_676a_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_676a_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_42fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_2ccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_b395] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_b395_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_b395_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_80f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_6846] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_6846_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_7a5a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_bf8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_b1fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_f871] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_f871_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_f871_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_8b88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_59ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_01e5] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_01e5_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l36_c7_8b06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l65_c7_a99d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_4636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_4636_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_4636_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_c50c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_94b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_3f65_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b34e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ccd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_7fb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_44ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_8845_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e1e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_b395_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_40bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f056_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_9e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_ecec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_c5cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_59ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_1286_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_863a_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_bf8a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_5426_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_80f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_42fd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_c499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c50c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_f252_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_0f15_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_b9a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_e222_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4636_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_8b06_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_6a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_8b88_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_424c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_4e2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b1fc_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_676a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2628_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_30a3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a99d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_3f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_94b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_608b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_e781_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_b786_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_7846_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f871_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_865f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_8f8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_0384_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_2af7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_93ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e37_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_7a5a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_71a1_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_0281_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_6846_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_cc62_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_8213_return_output;
     VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_01e5_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l125_l117_l143_l82_l100_l65_l73_DUPLICATE_04fb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_c7a6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_625c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_625c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_a5d0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_66ee_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_DUPLICATE_657b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l46_l161_l90_l54_l108_l135_l152_l36_l125_l117_l143_l82_l160_l100_l65_l73_DUPLICATE_4344_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_0384] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_0532] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_0532] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_4f17] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output := auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_d40d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_d40d_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_left;
     BIN_OP_OR_uxn_device_h_l144_c4_d40d_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output := BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_5426] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_5426] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_d1d3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_7fb3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_0384] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_3390] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_81e6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_7fb3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_6cdd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output := CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_9e7a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_1ab3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_608b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_0281_cond;
     pixel_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_0281_return_output := pixel_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_81e6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_8444] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_8444_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_left;
     BIN_OP_OR_uxn_device_h_l109_c4_8444_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output := BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_0532] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_8930] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_3390] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_1ab3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_1ab3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_fb68] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_608b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_6a98] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_7e64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_d1d3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_9e7a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_4f17] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_81e6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_6cdd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_d1d3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_4f17] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_0384] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_608b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_9e7a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_3390] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_6cdd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_608b] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_608b_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_608b_cond;
     sprite_MUX_uxn_device_h_l73_c3_608b_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_608b_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_608b_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_608b_return_output := sprite_MUX_uxn_device_h_l73_c3_608b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_5426] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_fb68] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_36f9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_946f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_fb68] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_81e6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output;

     -- color_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_color_MUX_uxn_device_h_l54_c3_0281_cond;
     color_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_0281_iftrue;
     color_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_0281_return_output := color_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_946f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_7fb3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_0738_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_7e64_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_6a98_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_8444_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_5426_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_d40d_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_36f9_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_0384_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_3746_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_4f17_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_7fb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_d1d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_9e7a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_3390_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_5426_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_946f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_81e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_1ab3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb68_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_608b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_0532_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0384_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_4f17_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_7fb3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_d1d3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_9e7a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_3390_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_5426_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_8930_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_81e6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_1ab3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb68_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_608b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_0532_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0384_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_4f17_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_7fb3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_d1d3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_9e7a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_3390_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_5426_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_946f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_81e6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_1ab3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb68_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_608b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_0532_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0384_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_81e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_6cdd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_6cdd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_6cdd_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_608b_return_output;
     -- MUX[uxn_device_h_l57_c20_0738] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_0738_cond <= VAR_MUX_uxn_device_h_l57_c20_0738_cond;
     MUX_uxn_device_h_l57_c20_0738_iftrue <= VAR_MUX_uxn_device_h_l57_c20_0738_iftrue;
     MUX_uxn_device_h_l57_c20_0738_iffalse <= VAR_MUX_uxn_device_h_l57_c20_0738_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_0738_return_output := MUX_uxn_device_h_l57_c20_0738_return_output;

     -- x_MUX[uxn_device_h_l90_c3_0384] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_0384_cond <= VAR_x_MUX_uxn_device_h_l90_c3_0384_cond;
     x_MUX_uxn_device_h_l90_c3_0384_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_0384_iftrue;
     x_MUX_uxn_device_h_l90_c3_0384_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_0384_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_0384_return_output := x_MUX_uxn_device_h_l90_c3_0384_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- color_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_color_MUX_uxn_device_h_l53_c7_4e2d_cond;
     color_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     color_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_4e2d_return_output := color_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- y_MUX[uxn_device_h_l125_c3_9e7a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_9e7a_cond <= VAR_y_MUX_uxn_device_h_l125_c3_9e7a_cond;
     y_MUX_uxn_device_h_l125_c3_9e7a_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iftrue;
     y_MUX_uxn_device_h_l125_c3_9e7a_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_9e7a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_9e7a_return_output := y_MUX_uxn_device_h_l125_c3_9e7a_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_cond;
     sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_return_output := sprite_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_8930] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output := auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_cond;
     pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output := pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- x_MUX[uxn_device_h_l108_c3_7fb3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_7fb3_cond <= VAR_x_MUX_uxn_device_h_l108_c3_7fb3_cond;
     x_MUX_uxn_device_h_l108_c3_7fb3_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iftrue;
     x_MUX_uxn_device_h_l108_c3_7fb3_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_7fb3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_7fb3_return_output := x_MUX_uxn_device_h_l108_c3_7fb3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_ab44] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_8930] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_8930] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_1e31] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_1e31_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_left;
     BIN_OP_GT_uxn_device_h_l153_c27_1e31_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output := BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output;

     -- y_MUX[uxn_device_h_l143_c3_5426] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_5426_cond <= VAR_y_MUX_uxn_device_h_l143_c3_5426_cond;
     y_MUX_uxn_device_h_l143_c3_5426_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_5426_iftrue;
     y_MUX_uxn_device_h_l143_c3_5426_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_5426_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_5426_return_output := y_MUX_uxn_device_h_l143_c3_5426_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_21bd_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_1e31_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_ace6 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_ab44_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue := VAR_MUX_uxn_device_h_l57_c20_0738_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_8930_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_8930_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_8930_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_7fb3_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_865f_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_0384_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_40bf_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_9e7a_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_863a_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_5426_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_ace6;
     -- x_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_x_MUX_uxn_device_h_l107_c7_c9d2_cond;
     x_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     x_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_c9d2_return_output := x_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- pixel_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_cond;
     pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output := pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- color_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_color_MUX_uxn_device_h_l45_c7_6a5d_cond;
     color_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     color_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_6a5d_return_output := color_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_8f59] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output := auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_2628_cond;
     sprite_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_2628_return_output := sprite_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- y_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_y_MUX_uxn_device_h_l142_c7_863a_cond;
     y_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_863a_iftrue;
     y_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_863a_return_output := y_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_0281] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output;

     -- MUX[uxn_device_h_l153_c27_21bd] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_21bd_cond <= VAR_MUX_uxn_device_h_l153_c27_21bd_cond;
     MUX_uxn_device_h_l153_c27_21bd_iftrue <= VAR_MUX_uxn_device_h_l153_c27_21bd_iftrue;
     MUX_uxn_device_h_l153_c27_21bd_iffalse <= VAR_MUX_uxn_device_h_l153_c27_21bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_21bd_return_output := MUX_uxn_device_h_l153_c27_21bd_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue := VAR_MUX_uxn_device_h_l153_c27_21bd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0281_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_8f59_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_863a_return_output;
     -- pixel_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_e222_cond;
     pixel_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_e222_return_output := pixel_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- color_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_color_MUX_uxn_device_h_l35_c2_e222_cond;
     color_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_e222_iftrue;
     color_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_e222_return_output := color_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_946f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output;

     -- x_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_x_MUX_uxn_device_h_l99_c7_93ec_cond;
     x_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     x_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_93ec_return_output := x_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output := auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- y_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_y_MUX_uxn_device_h_l134_c7_c5cf_cond;
     y_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     y_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_c5cf_return_output := y_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_cond;
     sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output := sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_863a_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_946f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- y_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_y_MUX_uxn_device_h_l124_c7_40bf_cond;
     y_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     y_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_40bf_return_output := y_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- x_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_x_MUX_uxn_device_h_l89_c7_865f_cond;
     x_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_865f_iftrue;
     x_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_865f_return_output := x_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output := auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_cond;
     sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output := sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_40bf_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_e222_cond;
     sprite_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_e222_return_output := sprite_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- y_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_y_MUX_uxn_device_h_l116_c7_8845_cond;
     y_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_8845_iftrue;
     y_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_8845_return_output := y_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output := auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- x_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_x_MUX_uxn_device_h_l81_c7_b786_cond;
     x_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_b786_iftrue;
     x_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_b786_return_output := x_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_40bf_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_8845_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_vram_value_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- x_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_x_MUX_uxn_device_h_l72_c7_3f25_cond;
     x_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     x_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_3f25_return_output := x_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output := auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- y_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_y_MUX_uxn_device_h_l107_c7_c9d2_cond;
     y_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     y_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_c9d2_return_output := y_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- y_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_y_MUX_uxn_device_h_l99_c7_93ec_cond;
     y_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     y_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_93ec_return_output := y_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- x_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_x_MUX_uxn_device_h_l64_c7_2628_cond;
     x_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_2628_iftrue;
     x_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_2628_return_output := x_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output := auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_93ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- y_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_y_MUX_uxn_device_h_l89_c7_865f_cond;
     y_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_865f_iftrue;
     y_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_865f_return_output := y_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output := auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- x_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_x_MUX_uxn_device_h_l53_c7_4e2d_cond;
     x_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     x_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_4e2d_return_output := x_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_8845] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8845_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_865f_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- y_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_y_MUX_uxn_device_h_l81_c7_b786_cond;
     y_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_b786_iftrue;
     y_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_b786_return_output := y_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_40bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output := auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- x_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_x_MUX_uxn_device_h_l45_c7_6a5d_cond;
     x_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     x_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_6a5d_return_output := x_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_40bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_c9d2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_b786_return_output;
     -- auto_advance_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output := auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- y_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_y_MUX_uxn_device_h_l72_c7_3f25_cond;
     y_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     y_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_3f25_return_output := y_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- x_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_x_MUX_uxn_device_h_l35_c2_e222_cond;
     x_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_e222_iftrue;
     x_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_e222_return_output := x_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_93ec] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_c5cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_c5cf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_93ec_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_865f_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_3f25_return_output;
     -- auto_advance_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output := auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- y_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_y_MUX_uxn_device_h_l64_c7_2628_cond;
     y_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_2628_iftrue;
     y_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_2628_return_output := y_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_863a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_865f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_863a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_865f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_2628_return_output;
     -- y_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_y_MUX_uxn_device_h_l53_c7_4e2d_cond;
     y_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     y_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_4e2d_return_output := y_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output := auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_b569] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_b786] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_b569_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_b786_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     -- y_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_y_MUX_uxn_device_h_l45_c7_6a5d_cond;
     y_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     y_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_6a5d_return_output := y_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_3f25] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output := auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_1b67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1b67_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_3f25_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_58ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- y_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_y_MUX_uxn_device_h_l35_c2_e222_cond;
     y_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_e222_iftrue;
     y_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_e222_return_output := y_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output := auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_2628] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_58ee_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2628_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_e222_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output := auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_4e2d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_6536] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_6536_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_e222_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4e2d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_6a5d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- printf_uxn_device_h_l162_c4_3c70[uxn_device_h_l162_c4_3c70] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0 <= VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg0;
     printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1 <= VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg1;
     printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2 <= VAR_printf_uxn_device_h_l162_c4_3c70_uxn_device_h_l162_c4_3c70_arg2;
     -- Outputs

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_6a5d_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- result_vram_address_MUX[uxn_device_h_l35_c2_e222] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_2136_uxn_device_h_l187_l26_DUPLICATE_d0c6 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_2136_uxn_device_h_l187_l26_DUPLICATE_d0c6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_2136(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_e222_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_e222_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_2136_uxn_device_h_l187_l26_DUPLICATE_d0c6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_2136_uxn_device_h_l187_l26_DUPLICATE_d0c6_return_output;
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
