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
-- printf_uxn_device_h_l33_c2_96bb[uxn_device_h_l33_c2_96bb]
signal printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_4881]
signal BIN_OP_EQ_uxn_device_h_l35_c6_4881_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_4881_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_77e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l35_c2_5503]
signal color_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_5503]
signal sprite_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_5503]
signal auto_advance_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l35_c2_5503]
signal x_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l35_c2_5503]
signal y_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_5503]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_5503]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_5503]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_5503]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_5503]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_5503]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_5503]
signal result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_5503]
signal result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_5503]
signal pixel_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_60ee]
signal BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_6752]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_6752]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_6752]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_6752]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_6fa2]
signal BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_21db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l45_c7_77e8]
signal color_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_77e8]
signal sprite_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_77e8]
signal auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l45_c7_77e8]
signal x_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l45_c7_77e8]
signal y_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_77e8]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_77e8]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_77e8]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_77e8]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_77e8]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_77e8]
signal result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_77e8]
signal result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_77e8]
signal pixel_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_722d]
signal BIN_OP_EQ_uxn_device_h_l46_c7_722d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_722d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_77e4]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_77e4]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_77e4]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_b7e8]
signal BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_6b2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l53_c7_21db]
signal color_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_21db]
signal sprite_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_21db]
signal auto_advance_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l53_c7_21db]
signal x_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l53_c7_21db]
signal y_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_21db]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_21db]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_21db]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_21db]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_21db]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_21db]
signal result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_21db]
signal result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_21db]
signal pixel_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_1e0f]
signal BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_0e07]
signal color_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_0e07]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_0e07]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_0e07]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_0e07]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_0e07]
signal pixel_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_5d57]
signal BIN_OP_AND_uxn_device_h_l57_c20_5d57_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_5d57_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_62b6]
signal BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_82f3]
signal MUX_uxn_device_h_l57_c20_82f3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_82f3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_82f3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_82f3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_06aa]
signal BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_261e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_6b2d]
signal sprite_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_6b2d]
signal auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l64_c7_6b2d]
signal x_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l64_c7_6b2d]
signal y_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_6b2d]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_6b2d]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_6b2d]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_6b2d]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_6b2d]
signal result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_6b2d]
signal result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_232c]
signal BIN_OP_EQ_uxn_device_h_l65_c7_232c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_232c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_3a95]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_3a95]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_3a95]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_81de]
signal BIN_OP_EQ_uxn_device_h_l72_c11_81de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_81de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_30e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_261e]
signal sprite_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_261e]
signal auto_advance_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l72_c7_261e]
signal x_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l72_c7_261e]
signal y_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_261e]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_261e]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_261e]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_261e]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_261e]
signal result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_261e]
signal result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_6c13]
signal BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_62cd]
signal sprite_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_62cd]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_62cd]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_62cd]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_3bfa]
signal BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_2b87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_30e1]
signal auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_30e1]
signal x_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l81_c7_30e1]
signal y_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_30e1]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_30e1]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_30e1]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_30e1]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_30e1]
signal result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_30e1]
signal result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_fb3e]
signal BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_8822]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_8822]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_8822]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_5cf8]
signal BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_c5d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_2b87]
signal auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l89_c7_2b87]
signal x_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l89_c7_2b87]
signal y_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_2b87]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_2b87]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_2b87]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_2b87]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_2b87]
signal result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_2b87]
signal result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_e492]
signal BIN_OP_EQ_uxn_device_h_l90_c7_e492_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_e492_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c3_96a4]
signal x_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_96a4]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_96a4]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_96a4]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_fd48]
signal BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_25aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_c5d4]
signal auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c7_c5d4]
signal x_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l99_c7_c5d4]
signal y_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_c5d4]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_c5d4]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_c5d4]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_c5d4]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_c5d4]
signal result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_c5d4]
signal result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_0f57]
signal BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_7be8]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_7be8]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_7be8]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_e402]
signal BIN_OP_EQ_uxn_device_h_l107_c11_e402_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_e402_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_4df7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_25aa]
signal auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c7_25aa]
signal x_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l107_c7_25aa]
signal y_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_25aa]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_25aa]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_25aa]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_25aa]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_25aa]
signal result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_25aa]
signal result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_1378]
signal BIN_OP_EQ_uxn_device_h_l108_c7_1378_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_1378_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c3_871f]
signal x_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_871f]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_871f]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_871f]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_9009]
signal BIN_OP_OR_uxn_device_h_l109_c4_9009_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_9009_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_e6ac]
signal BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_82fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_4df7]
signal auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_4df7]
signal y_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_4df7]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_4df7]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_4df7]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_4df7]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_4df7]
signal result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_4df7]
signal result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_f93c]
signal BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_7151]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_7151]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_7151]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_c2f4]
signal BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_3e3b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_82fd]
signal auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l124_c7_82fd]
signal y_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_82fd]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_82fd]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_82fd]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_82fd]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_82fd]
signal result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_82fd]
signal result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_7dab]
signal BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_420b]
signal y_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_420b]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_420b]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_420b]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_0ab8]
signal BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_c229]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_3e3b]
signal auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l134_c7_3e3b]
signal y_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_3e3b]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_3e3b]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_3e3b]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_3e3b]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_3e3b]
signal result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_3e3b]
signal result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_c783]
signal BIN_OP_EQ_uxn_device_h_l135_c7_c783_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_c783_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_5b98]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_5b98]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_5b98]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_3977]
signal BIN_OP_EQ_uxn_device_h_l142_c11_3977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_3977_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_c397]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_c229]
signal auto_advance_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l142_c7_c229]
signal y_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_c229]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_c229]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_c229]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_c229]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_c229]
signal result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_c229]
signal result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_e281]
signal BIN_OP_EQ_uxn_device_h_l143_c7_e281_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_e281_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_2799]
signal y_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_2799]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_2799]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_2799]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_bf90]
signal BIN_OP_OR_uxn_device_h_l144_c4_bf90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_bf90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_1409]
signal BIN_OP_EQ_uxn_device_h_l151_c11_1409_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_1409_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_c889]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_c397]
signal auto_advance_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_c397]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_c397]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_c397]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_c397]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_c397]
signal result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_c397]
signal result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_129a]
signal BIN_OP_EQ_uxn_device_h_l152_c7_129a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_129a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_6b5e]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_6b5e]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_6b5e]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_6fbf]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_b0c0]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_c647]
signal BIN_OP_GT_uxn_device_h_l153_c27_c647_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_c647_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_fa9d]
signal MUX_uxn_device_h_l153_c27_fa9d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_fa9d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_fa9d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_fa9d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_cdd0]
signal BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_25cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_c889]
signal auto_advance_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_c889]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_c889]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_c889]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_c889]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_c889]
signal result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_c889]
signal result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_d06f]
signal BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_1d1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_e214]
signal auto_advance_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_e214]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_e214]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_e214]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_e214]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_e214]
signal result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_e214]
signal result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(1 downto 0);

-- printf_uxn_device_h_l162_c4_52c3[uxn_device_h_l162_c4_52c3]
signal printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_c598]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_0173]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_6c6e]
signal BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_6cbb]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_6cbb]
signal result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_6cbb]
signal result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_6cbb]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_1db1]
signal BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_8e8f]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_8e8f]
signal result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_8e8f]
signal result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(31 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_c2de( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_read := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.vram_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb
printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb : entity work.printf_uxn_device_h_l33_c2_96bb_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0,
printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_4881
BIN_OP_EQ_uxn_device_h_l35_c6_4881 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_4881_left,
BIN_OP_EQ_uxn_device_h_l35_c6_4881_right,
BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- color_MUX_uxn_device_h_l35_c2_5503
color_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_5503_cond,
color_MUX_uxn_device_h_l35_c2_5503_iftrue,
color_MUX_uxn_device_h_l35_c2_5503_iffalse,
color_MUX_uxn_device_h_l35_c2_5503_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_5503
sprite_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_5503_cond,
sprite_MUX_uxn_device_h_l35_c2_5503_iftrue,
sprite_MUX_uxn_device_h_l35_c2_5503_iffalse,
sprite_MUX_uxn_device_h_l35_c2_5503_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_5503
auto_advance_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_5503_cond,
auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output);

-- x_MUX_uxn_device_h_l35_c2_5503
x_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_5503_cond,
x_MUX_uxn_device_h_l35_c2_5503_iftrue,
x_MUX_uxn_device_h_l35_c2_5503_iffalse,
x_MUX_uxn_device_h_l35_c2_5503_return_output);

-- y_MUX_uxn_device_h_l35_c2_5503
y_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_5503_cond,
y_MUX_uxn_device_h_l35_c2_5503_iftrue,
y_MUX_uxn_device_h_l35_c2_5503_iffalse,
y_MUX_uxn_device_h_l35_c2_5503_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_5503
is_fill_mode_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_5503
result_is_vram_write_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_5503
result_is_deo_done_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_5503
result_device_ram_address_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_5503
result_vram_address_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_5503
result_vram_value_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_5503
pixel_MUX_uxn_device_h_l35_c2_5503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_5503_cond,
pixel_MUX_uxn_device_h_l35_c2_5503_iftrue,
pixel_MUX_uxn_device_h_l35_c2_5503_iffalse,
pixel_MUX_uxn_device_h_l35_c2_5503_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_60ee
BIN_OP_EQ_uxn_device_h_l36_c7_60ee : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left,
BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right,
BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_6752
result_is_deo_done_MUX_uxn_device_h_l36_c3_6752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_6752
result_device_ram_address_MUX_uxn_device_h_l36_c3_6752 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_6fa2
BIN_OP_EQ_uxn_device_h_l45_c11_6fa2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left,
BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right,
BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output);

-- color_MUX_uxn_device_h_l45_c7_77e8
color_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_77e8_cond,
color_MUX_uxn_device_h_l45_c7_77e8_iftrue,
color_MUX_uxn_device_h_l45_c7_77e8_iffalse,
color_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_77e8
sprite_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_77e8_cond,
sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue,
sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse,
sprite_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_77e8
auto_advance_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond,
auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- x_MUX_uxn_device_h_l45_c7_77e8
x_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_77e8_cond,
x_MUX_uxn_device_h_l45_c7_77e8_iftrue,
x_MUX_uxn_device_h_l45_c7_77e8_iffalse,
x_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- y_MUX_uxn_device_h_l45_c7_77e8
y_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_77e8_cond,
y_MUX_uxn_device_h_l45_c7_77e8_iftrue,
y_MUX_uxn_device_h_l45_c7_77e8_iffalse,
y_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_77e8
is_fill_mode_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8
result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8
result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8
result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_77e8
result_vram_address_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_77e8
result_vram_value_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_77e8
pixel_MUX_uxn_device_h_l45_c7_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_77e8_cond,
pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue,
pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse,
pixel_MUX_uxn_device_h_l45_c7_77e8_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_722d
BIN_OP_EQ_uxn_device_h_l46_c7_722d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_722d_left,
BIN_OP_EQ_uxn_device_h_l46_c7_722d_right,
BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4
result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4
result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_b7e8
BIN_OP_EQ_uxn_device_h_l53_c11_b7e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left,
BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right,
BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- color_MUX_uxn_device_h_l53_c7_21db
color_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_21db_cond,
color_MUX_uxn_device_h_l53_c7_21db_iftrue,
color_MUX_uxn_device_h_l53_c7_21db_iffalse,
color_MUX_uxn_device_h_l53_c7_21db_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_21db
sprite_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_21db_cond,
sprite_MUX_uxn_device_h_l53_c7_21db_iftrue,
sprite_MUX_uxn_device_h_l53_c7_21db_iffalse,
sprite_MUX_uxn_device_h_l53_c7_21db_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_21db
auto_advance_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_21db_cond,
auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output);

-- x_MUX_uxn_device_h_l53_c7_21db
x_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_21db_cond,
x_MUX_uxn_device_h_l53_c7_21db_iftrue,
x_MUX_uxn_device_h_l53_c7_21db_iffalse,
x_MUX_uxn_device_h_l53_c7_21db_return_output);

-- y_MUX_uxn_device_h_l53_c7_21db
y_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_21db_cond,
y_MUX_uxn_device_h_l53_c7_21db_iftrue,
y_MUX_uxn_device_h_l53_c7_21db_iffalse,
y_MUX_uxn_device_h_l53_c7_21db_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_21db
is_fill_mode_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_21db
result_is_vram_write_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_21db
result_is_deo_done_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_21db
result_device_ram_address_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_21db
result_vram_address_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_21db
result_vram_value_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_21db
pixel_MUX_uxn_device_h_l53_c7_21db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_21db_cond,
pixel_MUX_uxn_device_h_l53_c7_21db_iftrue,
pixel_MUX_uxn_device_h_l53_c7_21db_iffalse,
pixel_MUX_uxn_device_h_l53_c7_21db_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_1e0f
BIN_OP_EQ_uxn_device_h_l54_c7_1e0f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left,
BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right,
BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output);

-- color_MUX_uxn_device_h_l54_c3_0e07
color_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_0e07_cond,
color_MUX_uxn_device_h_l54_c3_0e07_iftrue,
color_MUX_uxn_device_h_l54_c3_0e07_iffalse,
color_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_0e07
is_fill_mode_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07
result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07
result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_0e07
pixel_MUX_uxn_device_h_l54_c3_0e07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_0e07_cond,
pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue,
pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse,
pixel_MUX_uxn_device_h_l54_c3_0e07_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_5d57
BIN_OP_AND_uxn_device_h_l57_c20_5d57 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_5d57_left,
BIN_OP_AND_uxn_device_h_l57_c20_5d57_right,
BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_62b6
BIN_OP_EQ_uxn_device_h_l57_c20_62b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left,
BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right,
BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output);

-- MUX_uxn_device_h_l57_c20_82f3
MUX_uxn_device_h_l57_c20_82f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_82f3_cond,
MUX_uxn_device_h_l57_c20_82f3_iftrue,
MUX_uxn_device_h_l57_c20_82f3_iffalse,
MUX_uxn_device_h_l57_c20_82f3_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_06aa
BIN_OP_EQ_uxn_device_h_l64_c11_06aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left,
BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right,
BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_6b2d
sprite_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_6b2d_cond,
sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_6b2d
auto_advance_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond,
auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- x_MUX_uxn_device_h_l64_c7_6b2d
x_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_6b2d_cond,
x_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
x_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
x_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- y_MUX_uxn_device_h_l64_c7_6b2d
y_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_6b2d_cond,
y_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
y_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
y_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d
result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d
result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d
result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_6b2d
result_vram_address_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_6b2d
result_vram_value_MUX_uxn_device_h_l64_c7_6b2d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_232c
BIN_OP_EQ_uxn_device_h_l65_c7_232c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_232c_left,
BIN_OP_EQ_uxn_device_h_l65_c7_232c_right,
BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95
result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95
result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_81de
BIN_OP_EQ_uxn_device_h_l72_c11_81de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_81de_left,
BIN_OP_EQ_uxn_device_h_l72_c11_81de_right,
BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_261e
sprite_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_261e_cond,
sprite_MUX_uxn_device_h_l72_c7_261e_iftrue,
sprite_MUX_uxn_device_h_l72_c7_261e_iffalse,
sprite_MUX_uxn_device_h_l72_c7_261e_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_261e
auto_advance_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_261e_cond,
auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output);

-- x_MUX_uxn_device_h_l72_c7_261e
x_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_261e_cond,
x_MUX_uxn_device_h_l72_c7_261e_iftrue,
x_MUX_uxn_device_h_l72_c7_261e_iffalse,
x_MUX_uxn_device_h_l72_c7_261e_return_output);

-- y_MUX_uxn_device_h_l72_c7_261e
y_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_261e_cond,
y_MUX_uxn_device_h_l72_c7_261e_iftrue,
y_MUX_uxn_device_h_l72_c7_261e_iffalse,
y_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_261e
result_is_vram_write_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_261e
result_is_deo_done_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_261e
result_device_ram_address_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_261e
result_vram_address_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_261e
result_vram_value_MUX_uxn_device_h_l72_c7_261e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_6c13
BIN_OP_EQ_uxn_device_h_l73_c7_6c13 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left,
BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right,
BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_62cd
sprite_MUX_uxn_device_h_l73_c3_62cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_62cd_cond,
sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue,
sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse,
sprite_MUX_uxn_device_h_l73_c3_62cd_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd
result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd
result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_3bfa
BIN_OP_EQ_uxn_device_h_l81_c11_3bfa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left,
BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right,
BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_30e1
auto_advance_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond,
auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- x_MUX_uxn_device_h_l81_c7_30e1
x_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_30e1_cond,
x_MUX_uxn_device_h_l81_c7_30e1_iftrue,
x_MUX_uxn_device_h_l81_c7_30e1_iffalse,
x_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- y_MUX_uxn_device_h_l81_c7_30e1
y_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_30e1_cond,
y_MUX_uxn_device_h_l81_c7_30e1_iftrue,
y_MUX_uxn_device_h_l81_c7_30e1_iffalse,
y_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1
result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1
result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1
result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_30e1
result_vram_address_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_30e1
result_vram_value_MUX_uxn_device_h_l81_c7_30e1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_fb3e
BIN_OP_EQ_uxn_device_h_l82_c7_fb3e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left,
BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right,
BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_8822
result_is_deo_done_MUX_uxn_device_h_l82_c3_8822 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_8822
result_device_ram_address_MUX_uxn_device_h_l82_c3_8822 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_5cf8
BIN_OP_EQ_uxn_device_h_l89_c11_5cf8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left,
BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right,
BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_2b87
auto_advance_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond,
auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- x_MUX_uxn_device_h_l89_c7_2b87
x_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_2b87_cond,
x_MUX_uxn_device_h_l89_c7_2b87_iftrue,
x_MUX_uxn_device_h_l89_c7_2b87_iffalse,
x_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- y_MUX_uxn_device_h_l89_c7_2b87
y_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_2b87_cond,
y_MUX_uxn_device_h_l89_c7_2b87_iftrue,
y_MUX_uxn_device_h_l89_c7_2b87_iffalse,
y_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87
result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87
result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87
result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_2b87
result_vram_address_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_2b87
result_vram_value_MUX_uxn_device_h_l89_c7_2b87 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_e492
BIN_OP_EQ_uxn_device_h_l90_c7_e492 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_e492_left,
BIN_OP_EQ_uxn_device_h_l90_c7_e492_right,
BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output);

-- x_MUX_uxn_device_h_l90_c3_96a4
x_MUX_uxn_device_h_l90_c3_96a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_96a4_cond,
x_MUX_uxn_device_h_l90_c3_96a4_iftrue,
x_MUX_uxn_device_h_l90_c3_96a4_iffalse,
x_MUX_uxn_device_h_l90_c3_96a4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4
result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4
result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_fd48
BIN_OP_EQ_uxn_device_h_l99_c11_fd48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left,
BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right,
BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_c5d4
auto_advance_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond,
auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- x_MUX_uxn_device_h_l99_c7_c5d4
x_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_c5d4_cond,
x_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
x_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
x_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- y_MUX_uxn_device_h_l99_c7_c5d4
y_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_c5d4_cond,
y_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
y_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
y_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4
result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4
result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4
result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_c5d4
result_vram_address_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_c5d4
result_vram_value_MUX_uxn_device_h_l99_c7_c5d4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_0f57
BIN_OP_EQ_uxn_device_h_l100_c7_0f57 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left,
BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right,
BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8
result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8
result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_e402
BIN_OP_EQ_uxn_device_h_l107_c11_e402 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_e402_left,
BIN_OP_EQ_uxn_device_h_l107_c11_e402_right,
BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_25aa
auto_advance_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond,
auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- x_MUX_uxn_device_h_l107_c7_25aa
x_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_25aa_cond,
x_MUX_uxn_device_h_l107_c7_25aa_iftrue,
x_MUX_uxn_device_h_l107_c7_25aa_iffalse,
x_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- y_MUX_uxn_device_h_l107_c7_25aa
y_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_25aa_cond,
y_MUX_uxn_device_h_l107_c7_25aa_iftrue,
y_MUX_uxn_device_h_l107_c7_25aa_iffalse,
y_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa
result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa
result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa
result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_25aa
result_vram_address_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_25aa
result_vram_value_MUX_uxn_device_h_l107_c7_25aa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_1378
BIN_OP_EQ_uxn_device_h_l108_c7_1378 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_1378_left,
BIN_OP_EQ_uxn_device_h_l108_c7_1378_right,
BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output);

-- x_MUX_uxn_device_h_l108_c3_871f
x_MUX_uxn_device_h_l108_c3_871f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_871f_cond,
x_MUX_uxn_device_h_l108_c3_871f_iftrue,
x_MUX_uxn_device_h_l108_c3_871f_iffalse,
x_MUX_uxn_device_h_l108_c3_871f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_871f
result_is_deo_done_MUX_uxn_device_h_l108_c3_871f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_871f
result_device_ram_address_MUX_uxn_device_h_l108_c3_871f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_9009
BIN_OP_OR_uxn_device_h_l109_c4_9009 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_9009_left,
BIN_OP_OR_uxn_device_h_l109_c4_9009_right,
BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_e6ac
BIN_OP_EQ_uxn_device_h_l116_c11_e6ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left,
BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right,
BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_4df7
auto_advance_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond,
auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- y_MUX_uxn_device_h_l116_c7_4df7
y_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_4df7_cond,
y_MUX_uxn_device_h_l116_c7_4df7_iftrue,
y_MUX_uxn_device_h_l116_c7_4df7_iffalse,
y_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7
result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7
result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7
result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_4df7
result_vram_address_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_4df7
result_vram_value_MUX_uxn_device_h_l116_c7_4df7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_f93c
BIN_OP_EQ_uxn_device_h_l117_c7_f93c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left,
BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right,
BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_7151
result_is_deo_done_MUX_uxn_device_h_l117_c3_7151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_7151
result_device_ram_address_MUX_uxn_device_h_l117_c3_7151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_c2f4
BIN_OP_EQ_uxn_device_h_l124_c11_c2f4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left,
BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right,
BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_82fd
auto_advance_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond,
auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- y_MUX_uxn_device_h_l124_c7_82fd
y_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_82fd_cond,
y_MUX_uxn_device_h_l124_c7_82fd_iftrue,
y_MUX_uxn_device_h_l124_c7_82fd_iffalse,
y_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd
result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd
result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd
result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_82fd
result_vram_address_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_82fd
result_vram_value_MUX_uxn_device_h_l124_c7_82fd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_7dab
BIN_OP_EQ_uxn_device_h_l125_c7_7dab : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left,
BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right,
BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output);

-- y_MUX_uxn_device_h_l125_c3_420b
y_MUX_uxn_device_h_l125_c3_420b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_420b_cond,
y_MUX_uxn_device_h_l125_c3_420b_iftrue,
y_MUX_uxn_device_h_l125_c3_420b_iffalse,
y_MUX_uxn_device_h_l125_c3_420b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_420b
result_is_deo_done_MUX_uxn_device_h_l125_c3_420b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_420b
result_device_ram_address_MUX_uxn_device_h_l125_c3_420b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_0ab8
BIN_OP_EQ_uxn_device_h_l134_c11_0ab8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left,
BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right,
BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_3e3b
auto_advance_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond,
auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- y_MUX_uxn_device_h_l134_c7_3e3b
y_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_3e3b_cond,
y_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
y_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
y_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b
result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b
result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b
result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_3e3b
result_vram_address_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_3e3b
result_vram_value_MUX_uxn_device_h_l134_c7_3e3b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_c783
BIN_OP_EQ_uxn_device_h_l135_c7_c783 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_c783_left,
BIN_OP_EQ_uxn_device_h_l135_c7_c783_right,
BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98
result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98
result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_3977
BIN_OP_EQ_uxn_device_h_l142_c11_3977 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_3977_left,
BIN_OP_EQ_uxn_device_h_l142_c11_3977_right,
BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_c229
auto_advance_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_c229_cond,
auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output);

-- y_MUX_uxn_device_h_l142_c7_c229
y_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_c229_cond,
y_MUX_uxn_device_h_l142_c7_c229_iftrue,
y_MUX_uxn_device_h_l142_c7_c229_iffalse,
y_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_c229
result_is_vram_write_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_c229
result_is_deo_done_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_c229
result_device_ram_address_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_c229
result_vram_address_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_c229
result_vram_value_MUX_uxn_device_h_l142_c7_c229 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_e281
BIN_OP_EQ_uxn_device_h_l143_c7_e281 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_e281_left,
BIN_OP_EQ_uxn_device_h_l143_c7_e281_right,
BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output);

-- y_MUX_uxn_device_h_l143_c3_2799
y_MUX_uxn_device_h_l143_c3_2799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_2799_cond,
y_MUX_uxn_device_h_l143_c3_2799_iftrue,
y_MUX_uxn_device_h_l143_c3_2799_iffalse,
y_MUX_uxn_device_h_l143_c3_2799_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_2799
result_is_deo_done_MUX_uxn_device_h_l143_c3_2799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_2799
result_device_ram_address_MUX_uxn_device_h_l143_c3_2799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_bf90
BIN_OP_OR_uxn_device_h_l144_c4_bf90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_bf90_left,
BIN_OP_OR_uxn_device_h_l144_c4_bf90_right,
BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_1409
BIN_OP_EQ_uxn_device_h_l151_c11_1409 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_1409_left,
BIN_OP_EQ_uxn_device_h_l151_c11_1409_right,
BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_c397
auto_advance_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_c397_cond,
auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_c397
result_is_vram_write_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_c397
result_is_deo_done_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_c397
result_device_ram_address_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_c397
result_vram_address_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_c397
result_vram_value_MUX_uxn_device_h_l151_c7_c397 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_129a
BIN_OP_EQ_uxn_device_h_l152_c7_129a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_129a_left,
BIN_OP_EQ_uxn_device_h_l152_c7_129a_right,
BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e
result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e
result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0
BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0 : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_c647
BIN_OP_GT_uxn_device_h_l153_c27_c647 : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_c647_left,
BIN_OP_GT_uxn_device_h_l153_c27_c647_right,
BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output);

-- MUX_uxn_device_h_l153_c27_fa9d
MUX_uxn_device_h_l153_c27_fa9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_fa9d_cond,
MUX_uxn_device_h_l153_c27_fa9d_iftrue,
MUX_uxn_device_h_l153_c27_fa9d_iffalse,
MUX_uxn_device_h_l153_c27_fa9d_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_cdd0
BIN_OP_EQ_uxn_device_h_l160_c11_cdd0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left,
BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right,
BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_c889
auto_advance_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_c889_cond,
auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_c889
result_is_vram_write_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_c889
result_is_deo_done_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_c889
result_device_ram_address_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_c889
result_vram_address_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_c889
result_vram_value_MUX_uxn_device_h_l160_c7_c889 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_d06f
BIN_OP_EQ_uxn_device_h_l161_c7_d06f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left,
BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right,
BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_e214
auto_advance_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_e214_cond,
auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_e214
result_is_vram_write_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_e214
result_is_deo_done_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_e214
result_device_ram_address_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_e214
result_vram_address_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_e214
result_vram_value_MUX_uxn_device_h_l161_c3_e214 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output);

-- printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3
printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3 : entity work.printf_uxn_device_h_l162_c4_52c3_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0,
printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1,
printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_0173
BIN_OP_PLUS_uxn_device_h_l167_c27_0173 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_6c6e
BIN_OP_EQ_uxn_device_h_l173_c11_6c6e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left,
BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right,
BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb
result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_6cbb
result_vram_value_MUX_uxn_device_h_l173_c7_6cbb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_6cbb
result_vram_address_MUX_uxn_device_h_l173_c7_6cbb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb
result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_1db1
BIN_OP_EQ_uxn_device_h_l174_c7_1db1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left,
BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right,
BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f
result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_8e8f
result_vram_value_MUX_uxn_device_h_l174_c3_8e8f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_8e8f
result_vram_address_MUX_uxn_device_h_l174_c3_8e8f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x,
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output,
 color_MUX_uxn_device_h_l35_c2_5503_return_output,
 sprite_MUX_uxn_device_h_l35_c2_5503_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output,
 x_MUX_uxn_device_h_l35_c2_5503_return_output,
 y_MUX_uxn_device_h_l35_c2_5503_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output,
 pixel_MUX_uxn_device_h_l35_c2_5503_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output,
 color_MUX_uxn_device_h_l45_c7_77e8_return_output,
 sprite_MUX_uxn_device_h_l45_c7_77e8_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output,
 x_MUX_uxn_device_h_l45_c7_77e8_return_output,
 y_MUX_uxn_device_h_l45_c7_77e8_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output,
 pixel_MUX_uxn_device_h_l45_c7_77e8_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 color_MUX_uxn_device_h_l53_c7_21db_return_output,
 sprite_MUX_uxn_device_h_l53_c7_21db_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output,
 x_MUX_uxn_device_h_l53_c7_21db_return_output,
 y_MUX_uxn_device_h_l53_c7_21db_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output,
 pixel_MUX_uxn_device_h_l53_c7_21db_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output,
 color_MUX_uxn_device_h_l54_c3_0e07_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output,
 pixel_MUX_uxn_device_h_l54_c3_0e07_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output,
 MUX_uxn_device_h_l57_c20_82f3_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output,
 sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 x_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 y_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output,
 sprite_MUX_uxn_device_h_l72_c7_261e_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output,
 x_MUX_uxn_device_h_l72_c7_261e_return_output,
 y_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output,
 sprite_MUX_uxn_device_h_l73_c3_62cd_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output,
 x_MUX_uxn_device_h_l81_c7_30e1_return_output,
 y_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output,
 x_MUX_uxn_device_h_l89_c7_2b87_return_output,
 y_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output,
 x_MUX_uxn_device_h_l90_c3_96a4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 x_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 y_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output,
 x_MUX_uxn_device_h_l107_c7_25aa_return_output,
 y_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output,
 x_MUX_uxn_device_h_l108_c3_871f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output,
 y_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output,
 y_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output,
 y_MUX_uxn_device_h_l125_c3_420b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 y_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output,
 y_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output,
 y_MUX_uxn_device_h_l143_c3_2799_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output,
 MUX_uxn_device_h_l153_c27_fa9d_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_5503_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_5503_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_41c5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_21db_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_a9f9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_f1f0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_0e1f_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_82f3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_82f3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_82f3_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_82f3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_4950 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_380e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_a38d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_2161 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_1bc3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_5181 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_6887 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_7cee : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_a7e4 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_36c2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_34ee : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_fa9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_fa9d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_fa9d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_fa9d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_607e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_8035 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_3c06_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_23ef_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_e6d9_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_b9d4 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_653c : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_22aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_c2de_uxn_device_h_l187_l26_DUPLICATE_63a6_return_output : device_out_result_t;
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
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_5181 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_5181;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l57_c20_82f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l57_c20_82f3_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_380e := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_380e;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_right := to_unsigned(575999, 20);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_a9f9 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_a9f9;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right := to_unsigned(7, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_36c2 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_36c2;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l178_c4_b9d4 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_b9d4;
     VAR_MUX_uxn_device_h_l153_c27_fa9d_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_1bc3 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_1bc3;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_a38d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_a38d;
     VAR_result_device_ram_address_uxn_device_h_l137_c4_a7e4 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_a7e4;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right := to_unsigned(10, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_right := to_unsigned(128, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_2161 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_2161;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right := to_unsigned(5, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_607e := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_607e;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_34ee := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_34ee;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_4950 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_4950;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l153_c27_fa9d_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_7cee := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_7cee;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_6887 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_6887;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right := to_unsigned(2, 2);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_41c5 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_41c5;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right := to_unsigned(14, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right := to_unsigned(800, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right := to_unsigned(800, 10);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_f1f0 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_f1f0;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue := to_unsigned(1, 1);
     VAR_result_vram_address_uxn_device_h_l177_c4_653c := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_653c;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_5503_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_77e8_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_21db_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_0e07_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right := x;
     VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_25aa_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_871f_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_5503_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_77e8_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_21db_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_261e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_30e1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_96a4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_left := y;
     VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_25aa_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_4df7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_420b_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_c229_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_2799_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_5503_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_77e8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_21db_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_261e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_30e1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_2b87_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l151_c11_1409] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_1409_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_1409_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_1e0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l64_c11_06aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_0e1f] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_0e1f_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l35_c6_4881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_4881_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_4881_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_1db1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_e6ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_cdd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_fd48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_d06f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c7_7dab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c7_1378] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_1378_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_1378_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_129a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_129a_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_129a_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_5d57] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_5d57_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_left;
     BIN_OP_AND_uxn_device_h_l57_c20_5d57_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output := BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_0f57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_22aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_22aa_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_e492] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_e492_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_e492_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c7_6c13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_6fa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_e281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_e281_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_e281_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_b7e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l46_c7_722d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_722d_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_722d_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_3c06] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_3c06_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l134_c11_0ab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l65_c7_232c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_232c_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_232c_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_f93c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_c2f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_e6d9] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_e6d9_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l89_c11_5cf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_3977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_3977_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_3977_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_81de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_81de_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_81de_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_fb3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_23ef] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_23ef_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l173_c11_6c6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output;

     -- printf_uxn_device_h_l33_c2_96bb[uxn_device_h_l33_c2_96bb] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0 <= VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg0;
     printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1 <= VAR_printf_uxn_device_h_l33_c2_96bb_uxn_device_h_l33_c2_96bb_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l36_c7_60ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l135_c7_c783] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_c783_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_c783_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_6fbf] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_3bfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_e402] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_e402_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_e402_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_5d57_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0f57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_e402_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_871f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_1378_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_4df7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_e6ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f93c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_c2f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_420b_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_7dab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_3e3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_0ab8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_c783_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_c229_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_3977_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_2799_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_e281_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_1409_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_129a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_cdd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_d06f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_6c6e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_1db1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_5503_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_4881_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_60ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_77e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_6fa2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_722d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_21db_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_b7e8_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_1e0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_6b2d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_06aa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_232c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_261e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_81de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_6c13_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_30e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_3bfa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_fb3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_2b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_5cf8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_96a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_e492_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_c5d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_fd48_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_6fbf_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_780d_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_0e07_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_0e1f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_23ef_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_e6d9_return_output;
     VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_3c06_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l90_l54_l135_l108_l117_l125_l143_l82_l100_l65_l73_l46_DUPLICATE_e667_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_18a8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_22aa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_22aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_3dbc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_2459_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_DUPLICATE_90fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l90_l54_l135_l152_l36_l108_l117_l125_l143_l82_l160_l100_l65_l73_l46_DUPLICATE_f99b_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_96a4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_b0c0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_3a95] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_871f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_8822] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_6752] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_62b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_5b98] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_7151] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_62cd] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_62cd_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_cond;
     sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_return_output := sprite_MUX_uxn_device_h_l73_c3_62cd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_7be8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output := CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_7151] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_2799] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output;

     -- color_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_color_MUX_uxn_device_h_l54_c3_0e07_cond;
     color_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     color_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_0e07_return_output := color_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_8e8f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_2799] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_6752] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_96a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_2799] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_bf90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_bf90_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_left;
     BIN_OP_OR_uxn_device_h_l144_c4_bf90_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output := BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_871f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_7be8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_5b98] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_77e4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_62cd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output := auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_62cd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_cond;
     pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_return_output := pixel_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_8e8f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_7be8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_8822] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_9009] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_9009_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_left;
     BIN_OP_OR_uxn_device_h_l109_c4_9009_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output := BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_6cbb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_3a95] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_8822] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_420b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_3a95] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_c598] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_77e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_5b98] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_420b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_96a4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_8e8f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_420b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_6b5e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_77e4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_7151] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_6752] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_871f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_6b5e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_6752] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_62cd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_82f3_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_62b6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_c598_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_871f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_9009_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_2799_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_bf90_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_b0c0_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_96a4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_420b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_32f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7be8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_871f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7151_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_420b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_5b98_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2799_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_6b5e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6752_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_77e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_3a95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_62cd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_8822_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_96a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7be8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_871f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7151_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_420b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_5b98_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2799_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_6cbb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6752_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_77e4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_3a95_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_62cd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_8822_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_96a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_7be8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_871f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7151_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_420b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_5b98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2799_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_6b5e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6752_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_77e4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_3a95_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_62cd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_8822_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_96a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6752_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_8e8f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_8e8f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_8e8f_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_62cd_return_output;
     -- y_MUX[uxn_device_h_l125_c3_420b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_420b_cond <= VAR_y_MUX_uxn_device_h_l125_c3_420b_cond;
     y_MUX_uxn_device_h_l125_c3_420b_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_420b_iftrue;
     y_MUX_uxn_device_h_l125_c3_420b_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_420b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_420b_return_output := y_MUX_uxn_device_h_l125_c3_420b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_6cbb] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output;

     -- color_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_color_MUX_uxn_device_h_l53_c7_21db_cond;
     color_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_21db_iftrue;
     color_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_21db_return_output := color_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_21db_cond;
     pixel_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_21db_return_output := pixel_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- x_MUX[uxn_device_h_l90_c3_96a4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_96a4_cond <= VAR_x_MUX_uxn_device_h_l90_c3_96a4_cond;
     x_MUX_uxn_device_h_l90_c3_96a4_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_96a4_iftrue;
     x_MUX_uxn_device_h_l90_c3_96a4_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_96a4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_96a4_return_output := x_MUX_uxn_device_h_l90_c3_96a4_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_c647] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_c647_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_left;
     BIN_OP_GT_uxn_device_h_l153_c27_c647_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output := BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output;

     -- x_MUX[uxn_device_h_l108_c3_871f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_871f_cond <= VAR_x_MUX_uxn_device_h_l108_c3_871f_cond;
     x_MUX_uxn_device_h_l108_c3_871f_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_871f_iftrue;
     x_MUX_uxn_device_h_l108_c3_871f_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_871f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_871f_return_output := x_MUX_uxn_device_h_l108_c3_871f_return_output;

     -- MUX[uxn_device_h_l57_c20_82f3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_82f3_cond <= VAR_MUX_uxn_device_h_l57_c20_82f3_cond;
     MUX_uxn_device_h_l57_c20_82f3_iftrue <= VAR_MUX_uxn_device_h_l57_c20_82f3_iftrue;
     MUX_uxn_device_h_l57_c20_82f3_iffalse <= VAR_MUX_uxn_device_h_l57_c20_82f3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_82f3_return_output := MUX_uxn_device_h_l57_c20_82f3_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_6cbb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_6cbb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_261e_cond;
     sprite_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_261e_return_output := sprite_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_0173] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output := auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- y_MUX[uxn_device_h_l143_c3_2799] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_2799_cond <= VAR_y_MUX_uxn_device_h_l143_c3_2799_cond;
     y_MUX_uxn_device_h_l143_c3_2799_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_2799_iftrue;
     y_MUX_uxn_device_h_l143_c3_2799_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_2799_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_2799_return_output := y_MUX_uxn_device_h_l143_c3_2799_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_fa9d_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_c647_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_8035 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0173_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue := VAR_MUX_uxn_device_h_l57_c20_82f3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_6cbb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_6cbb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_6cbb_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_25aa_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_871f_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2b87_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_96a4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_82fd_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_420b_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_c229_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_2799_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_8035;
     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output := auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- y_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_y_MUX_uxn_device_h_l142_c7_c229_cond;
     y_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_c229_iftrue;
     y_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_c229_return_output := y_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- pixel_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_cond;
     pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_return_output := pixel_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_e214] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output;

     -- x_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_x_MUX_uxn_device_h_l107_c7_25aa_cond;
     x_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     x_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_25aa_return_output := x_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_0e07] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- MUX[uxn_device_h_l153_c27_fa9d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_fa9d_cond <= VAR_MUX_uxn_device_h_l153_c27_fa9d_cond;
     MUX_uxn_device_h_l153_c27_fa9d_iftrue <= VAR_MUX_uxn_device_h_l153_c27_fa9d_iftrue;
     MUX_uxn_device_h_l153_c27_fa9d_iffalse <= VAR_MUX_uxn_device_h_l153_c27_fa9d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_fa9d_return_output := MUX_uxn_device_h_l153_c27_fa9d_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_cond;
     sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output := sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- color_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_color_MUX_uxn_device_h_l45_c7_77e8_cond;
     color_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     color_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_77e8_return_output := color_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue := VAR_MUX_uxn_device_h_l153_c27_fa9d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_0e07_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_e214_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_c229_return_output;
     -- color_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_color_MUX_uxn_device_h_l35_c2_5503_cond;
     color_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_5503_iftrue;
     color_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_5503_return_output := color_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_6b5e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- x_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_x_MUX_uxn_device_h_l99_c7_c5d4_cond;
     x_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     x_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_c5d4_return_output := x_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_5503_cond;
     pixel_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_5503_return_output := pixel_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_21db_cond;
     sprite_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_21db_return_output := sprite_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output := auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- y_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_y_MUX_uxn_device_h_l134_c7_3e3b_cond;
     y_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     y_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_3e3b_return_output := y_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_c229_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_21db_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_6b5e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     -- x_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_x_MUX_uxn_device_h_l89_c7_2b87_cond;
     x_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     x_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_2b87_return_output := x_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- y_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_y_MUX_uxn_device_h_l124_c7_82fd_cond;
     y_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     y_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_82fd_return_output := y_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_cond;
     sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_return_output := sprite_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output := auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_82fd_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output := auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- x_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_x_MUX_uxn_device_h_l81_c7_30e1_cond;
     x_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     x_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_30e1_return_output := x_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_5503_cond;
     sprite_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_5503_return_output := sprite_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- y_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_y_MUX_uxn_device_h_l116_c7_4df7_cond;
     y_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     y_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_4df7_return_output := y_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_82fd_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_4df7_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- y_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_y_MUX_uxn_device_h_l107_c7_25aa_cond;
     y_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     y_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_25aa_return_output := y_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output := auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- x_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_x_MUX_uxn_device_h_l72_c7_261e_cond;
     x_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_261e_iftrue;
     x_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_261e_return_output := x_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_25aa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output := auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- y_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_y_MUX_uxn_device_h_l99_c7_c5d4_cond;
     y_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     y_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_c5d4_return_output := y_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- x_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_x_MUX_uxn_device_h_l64_c7_6b2d_cond;
     x_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     x_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_6b2d_return_output := x_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     -- result_vram_value_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output := auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- x_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_x_MUX_uxn_device_h_l53_c7_21db_cond;
     x_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_21db_iftrue;
     x_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_21db_return_output := x_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- y_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_y_MUX_uxn_device_h_l89_c7_2b87_cond;
     y_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     y_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_2b87_return_output := y_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_4df7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4df7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_2b87_return_output;
     -- result_vram_value_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output := auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_82fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_25aa] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output;

     -- x_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_x_MUX_uxn_device_h_l45_c7_77e8_cond;
     x_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     x_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_77e8_return_output := x_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- y_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_y_MUX_uxn_device_h_l81_c7_30e1_cond;
     y_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     y_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_30e1_return_output := y_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_82fd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_25aa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_30e1_return_output;
     -- auto_advance_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output := auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_3e3b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- y_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_y_MUX_uxn_device_h_l72_c7_261e_cond;
     y_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_261e_iftrue;
     y_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_261e_return_output := y_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- x_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_x_MUX_uxn_device_h_l35_c2_5503_cond;
     x_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_5503_iftrue;
     x_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_5503_return_output := x_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_c5d4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_3e3b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_c5d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2b87_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_261e_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_2b87] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output;

     -- y_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_y_MUX_uxn_device_h_l64_c7_6b2d_cond;
     y_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     y_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_6b2d_return_output := y_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output := auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_c229] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_c229_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2b87_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- y_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_y_MUX_uxn_device_h_l53_c7_21db_cond;
     y_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_21db_iftrue;
     y_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_21db_return_output := y_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output := auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_c397] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_30e1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_c397_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_30e1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_21db_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_c889] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output;

     -- y_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_y_MUX_uxn_device_h_l45_c7_77e8_cond;
     y_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     y_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_77e8_return_output := y_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output := auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_261e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_c889_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_261e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_77e8_return_output;
     -- y_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_y_MUX_uxn_device_h_l35_c2_5503_cond;
     y_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_5503_iftrue;
     y_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_5503_return_output := y_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output := auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_6b2d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_25cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_25cb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_6b2d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_21db_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_5503_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_1d1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output := auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_21db] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_1d1c_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_5503_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_21db_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_77e8_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_77e8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- printf_uxn_device_h_l162_c4_52c3[uxn_device_h_l162_c4_52c3] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0 <= VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg0;
     printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1 <= VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg1;
     printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2 <= VAR_printf_uxn_device_h_l162_c4_52c3_uxn_device_h_l162_c4_52c3_arg2;
     -- Outputs

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_77e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_77e8_return_output;
     -- result_vram_address_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_5503] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_c2de_uxn_device_h_l187_l26_DUPLICATE_63a6 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_c2de_uxn_device_h_l187_l26_DUPLICATE_63a6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c2de(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_5503_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_5503_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_c2de_uxn_device_h_l187_l26_DUPLICATE_63a6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_c2de_uxn_device_h_l187_l26_DUPLICATE_63a6_return_output;
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
