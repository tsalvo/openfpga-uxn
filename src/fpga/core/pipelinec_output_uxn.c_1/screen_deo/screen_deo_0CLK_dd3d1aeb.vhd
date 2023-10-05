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
-- printf_uxn_device_h_l33_c2_8251[uxn_device_h_l33_c2_8251]
signal printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_073d]
signal BIN_OP_EQ_uxn_device_h_l35_c6_073d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_073d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_9a8b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l35_c2_f733]
signal y_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_f733]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_f733]
signal result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_f733]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_f733]
signal result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_f733]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_f733]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_f733]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_f733]
signal pixel_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_f733]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l35_c2_f733]
signal color_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_f733]
signal auto_advance_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l35_c2_f733]
signal x_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_f733]
signal sprite_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_b281]
signal BIN_OP_EQ_uxn_device_h_l36_c7_b281_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_b281_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_2289]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_2289]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_2289]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_2289]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_4b1f]
signal BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_2bff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l45_c7_9a8b]
signal y_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_9a8b]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_9a8b]
signal result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_9a8b]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_9a8b]
signal result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_9a8b]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_9a8b]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_9a8b]
signal pixel_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_9a8b]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l45_c7_9a8b]
signal color_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_9a8b]
signal auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l45_c7_9a8b]
signal x_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_9a8b]
signal sprite_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_7747]
signal BIN_OP_EQ_uxn_device_h_l46_c7_7747_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_7747_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_f682]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_f682]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_f682]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_9abc]
signal BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2bba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l53_c7_2bff]
signal y_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_2bff]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_2bff]
signal result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_2bff]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_2bff]
signal result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_2bff]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_2bff]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_2bff]
signal pixel_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_2bff]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l53_c7_2bff]
signal color_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_2bff]
signal auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l53_c7_2bff]
signal x_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_2bff]
signal sprite_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_b050]
signal BIN_OP_EQ_uxn_device_h_l54_c7_b050_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_b050_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_4212]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_4212]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_4212]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_4212]
signal pixel_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_4212]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_4212]
signal color_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_0041]
signal BIN_OP_AND_uxn_device_h_l57_c20_0041_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_0041_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_e8e6]
signal BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_c21f]
signal MUX_uxn_device_h_l57_c20_c21f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c21f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c21f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c21f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_bf13]
signal BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c32d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l64_c7_2bba]
signal y_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2bba]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_2bba]
signal result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_2bba]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_2bba]
signal result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_2bba]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_2bba]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_2bba]
signal auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l64_c7_2bba]
signal x_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_2bba]
signal sprite_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_a66f]
signal BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_34c8]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_34c8]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_34c8]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_9233]
signal BIN_OP_EQ_uxn_device_h_l72_c11_9233_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_9233_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_0b96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l72_c7_c32d]
signal y_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c32d]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_c32d]
signal result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_c32d]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_c32d]
signal result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_c32d]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_c32d]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_c32d]
signal auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l72_c7_c32d]
signal x_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_c32d]
signal sprite_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_9787]
signal BIN_OP_EQ_uxn_device_h_l73_c7_9787_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_9787_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_4c6b]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_4c6b]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_4c6b]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_4c6b]
signal sprite_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_988f]
signal BIN_OP_EQ_uxn_device_h_l81_c11_988f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_988f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_2e97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l81_c7_0b96]
signal y_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_0b96]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_0b96]
signal result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_0b96]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_0b96]
signal result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_0b96]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_0b96]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_0b96]
signal auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_0b96]
signal x_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_12d9]
signal BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_731a]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_731a]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_731a]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_4d0a]
signal BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_cb1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l89_c7_2e97]
signal y_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_2e97]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_2e97]
signal result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_2e97]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_2e97]
signal result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_2e97]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_2e97]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_2e97]
signal auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l89_c7_2e97]
signal x_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_c5dd]
signal BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_d788]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_d788]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_d788]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l90_c3_d788]
signal x_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_1e82]
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_d499]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l99_c7_cb1f]
signal y_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_cb1f]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_cb1f]
signal result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_cb1f]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_cb1f]
signal result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_cb1f]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_cb1f]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_cb1f]
signal auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c7_cb1f]
signal x_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_5321]
signal BIN_OP_EQ_uxn_device_h_l100_c7_5321_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_5321_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_5d6c]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_5d6c]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_5d6c]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_8ad6]
signal BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_e0ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l107_c7_d499]
signal y_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_d499]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_d499]
signal result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_d499]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_d499]
signal result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_d499]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_d499]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_d499]
signal auto_advance_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c7_d499]
signal x_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_a241]
signal BIN_OP_EQ_uxn_device_h_l108_c7_a241_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_a241_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_d1e7]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_d1e7]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_d1e7]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l108_c3_d1e7]
signal x_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_5521]
signal BIN_OP_OR_uxn_device_h_l109_c4_5521_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_5521_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_f183]
signal BIN_OP_EQ_uxn_device_h_l116_c11_f183_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_f183_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_4941]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l116_c7_e0ef]
signal y_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_e0ef]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_e0ef]
signal result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_e0ef]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_e0ef]
signal result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_e0ef]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_e0ef]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_e0ef]
signal auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_2925]
signal BIN_OP_EQ_uxn_device_h_l117_c7_2925_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_2925_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_b1d9]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_b1d9]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_b1d9]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_8ddb]
signal BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_7a26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c7_4941]
signal y_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_4941]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_4941]
signal result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_4941]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_4941]
signal result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_4941]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_4941]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_4941]
signal auto_advance_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_b0ba]
signal BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_5e95]
signal y_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_5e95]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_5e95]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_5e95]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_f945]
signal BIN_OP_EQ_uxn_device_h_l134_c11_f945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_f945_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_ee82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l134_c7_7a26]
signal y_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_7a26]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_7a26]
signal result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_7a26]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_7a26]
signal result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_7a26]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_7a26]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_7a26]
signal auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_5b2d]
signal BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_42c8]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_42c8]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_42c8]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_d6f9]
signal BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_bf36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l142_c7_ee82]
signal y_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_ee82]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_ee82]
signal result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_ee82]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_ee82]
signal result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_ee82]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_ee82]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_ee82]
signal auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_d5e5]
signal BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_303e]
signal y_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_303e]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_303e]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_303e]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_c370]
signal BIN_OP_OR_uxn_device_h_l144_c4_c370_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_c370_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_2535]
signal BIN_OP_EQ_uxn_device_h_l151_c11_2535_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_2535_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_8d37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_bf36]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_bf36]
signal result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_bf36]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_bf36]
signal result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_bf36]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_bf36]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_bf36]
signal auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_05af]
signal BIN_OP_EQ_uxn_device_h_l152_c7_05af_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_05af_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_bb34]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_bb34]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_bb34]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_c97e]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_2b2c]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_86d0]
signal BIN_OP_GT_uxn_device_h_l153_c27_86d0_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_86d0_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_716e]
signal MUX_uxn_device_h_l153_c27_716e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_716e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_716e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_716e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_f5cc]
signal BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_4c64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_8d37]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_8d37]
signal result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_8d37]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_8d37]
signal result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_8d37]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_8d37]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_8d37]
signal auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_9258]
signal BIN_OP_EQ_uxn_device_h_l161_c7_9258_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_9258_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_a8c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_0ea6]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_0ea6]
signal result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_0ea6]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_0ea6]
signal result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_0ea6]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_0ea6]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_0ea6]
signal auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(7 downto 0);

-- printf_uxn_device_h_l162_c4_c44b[uxn_device_h_l162_c4_c44b]
signal printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_abe8]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_0a74]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_4d81]
signal BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_2cc7]
signal result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_2cc7]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_2cc7]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_2cc7]
signal result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_cd28]
signal BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_9d94]
signal result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_9d94]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_9d94]
signal result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(1 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_8b12( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_read := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.vram_value := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.device_ram_address := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251
printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251 : entity work.printf_uxn_device_h_l33_c2_8251_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0,
printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_073d
BIN_OP_EQ_uxn_device_h_l35_c6_073d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_073d_left,
BIN_OP_EQ_uxn_device_h_l35_c6_073d_right,
BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- y_MUX_uxn_device_h_l35_c2_f733
y_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_f733_cond,
y_MUX_uxn_device_h_l35_c2_f733_iftrue,
y_MUX_uxn_device_h_l35_c2_f733_iffalse,
y_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_f733
result_vram_address_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_f733
result_is_deo_done_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_f733
result_vram_value_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_f733
result_is_vram_write_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_f733
result_device_ram_address_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_f733
pixel_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_f733_cond,
pixel_MUX_uxn_device_h_l35_c2_f733_iftrue,
pixel_MUX_uxn_device_h_l35_c2_f733_iffalse,
pixel_MUX_uxn_device_h_l35_c2_f733_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_f733
is_fill_mode_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output);

-- color_MUX_uxn_device_h_l35_c2_f733
color_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_f733_cond,
color_MUX_uxn_device_h_l35_c2_f733_iftrue,
color_MUX_uxn_device_h_l35_c2_f733_iffalse,
color_MUX_uxn_device_h_l35_c2_f733_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_f733
auto_advance_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_f733_cond,
auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output);

-- x_MUX_uxn_device_h_l35_c2_f733
x_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_f733_cond,
x_MUX_uxn_device_h_l35_c2_f733_iftrue,
x_MUX_uxn_device_h_l35_c2_f733_iffalse,
x_MUX_uxn_device_h_l35_c2_f733_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_f733
sprite_MUX_uxn_device_h_l35_c2_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_f733_cond,
sprite_MUX_uxn_device_h_l35_c2_f733_iftrue,
sprite_MUX_uxn_device_h_l35_c2_f733_iffalse,
sprite_MUX_uxn_device_h_l35_c2_f733_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_b281
BIN_OP_EQ_uxn_device_h_l36_c7_b281 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_b281_left,
BIN_OP_EQ_uxn_device_h_l36_c7_b281_right,
BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_2289
result_is_deo_done_MUX_uxn_device_h_l36_c3_2289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_2289
result_device_ram_address_MUX_uxn_device_h_l36_c3_2289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_4b1f
BIN_OP_EQ_uxn_device_h_l45_c11_4b1f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left,
BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right,
BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- y_MUX_uxn_device_h_l45_c7_9a8b
y_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_9a8b_cond,
y_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
y_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
y_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_9a8b
result_vram_address_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b
result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_9a8b
result_vram_value_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b
result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b
result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_9a8b
pixel_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_9a8b_cond,
pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b
is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- color_MUX_uxn_device_h_l45_c7_9a8b
color_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_9a8b_cond,
color_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
color_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
color_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_9a8b
auto_advance_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond,
auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- x_MUX_uxn_device_h_l45_c7_9a8b
x_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_9a8b_cond,
x_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
x_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
x_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_9a8b
sprite_MUX_uxn_device_h_l45_c7_9a8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_9a8b_cond,
sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue,
sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse,
sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_7747
BIN_OP_EQ_uxn_device_h_l46_c7_7747 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_7747_left,
BIN_OP_EQ_uxn_device_h_l46_c7_7747_right,
BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_f682
result_is_deo_done_MUX_uxn_device_h_l46_c3_f682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_f682
result_device_ram_address_MUX_uxn_device_h_l46_c3_f682 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_9abc
BIN_OP_EQ_uxn_device_h_l53_c11_9abc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left,
BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right,
BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- y_MUX_uxn_device_h_l53_c7_2bff
y_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_2bff_cond,
y_MUX_uxn_device_h_l53_c7_2bff_iftrue,
y_MUX_uxn_device_h_l53_c7_2bff_iffalse,
y_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_2bff
result_vram_address_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff
result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_2bff
result_vram_value_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff
result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff
result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_2bff
pixel_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_2bff_cond,
pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue,
pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse,
pixel_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_2bff
is_fill_mode_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- color_MUX_uxn_device_h_l53_c7_2bff
color_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_2bff_cond,
color_MUX_uxn_device_h_l53_c7_2bff_iftrue,
color_MUX_uxn_device_h_l53_c7_2bff_iffalse,
color_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_2bff
auto_advance_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond,
auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- x_MUX_uxn_device_h_l53_c7_2bff
x_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_2bff_cond,
x_MUX_uxn_device_h_l53_c7_2bff_iftrue,
x_MUX_uxn_device_h_l53_c7_2bff_iffalse,
x_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_2bff
sprite_MUX_uxn_device_h_l53_c7_2bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_2bff_cond,
sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue,
sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse,
sprite_MUX_uxn_device_h_l53_c7_2bff_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_b050
BIN_OP_EQ_uxn_device_h_l54_c7_b050 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_b050_left,
BIN_OP_EQ_uxn_device_h_l54_c7_b050_right,
BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_4212
result_is_deo_done_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_4212
result_device_ram_address_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_4212
pixel_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_4212_cond,
pixel_MUX_uxn_device_h_l54_c3_4212_iftrue,
pixel_MUX_uxn_device_h_l54_c3_4212_iffalse,
pixel_MUX_uxn_device_h_l54_c3_4212_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_4212
is_fill_mode_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output);

-- color_MUX_uxn_device_h_l54_c3_4212
color_MUX_uxn_device_h_l54_c3_4212 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_4212_cond,
color_MUX_uxn_device_h_l54_c3_4212_iftrue,
color_MUX_uxn_device_h_l54_c3_4212_iffalse,
color_MUX_uxn_device_h_l54_c3_4212_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_0041
BIN_OP_AND_uxn_device_h_l57_c20_0041 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_0041_left,
BIN_OP_AND_uxn_device_h_l57_c20_0041_right,
BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_e8e6
BIN_OP_EQ_uxn_device_h_l57_c20_e8e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left,
BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right,
BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output);

-- MUX_uxn_device_h_l57_c20_c21f
MUX_uxn_device_h_l57_c20_c21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_c21f_cond,
MUX_uxn_device_h_l57_c20_c21f_iftrue,
MUX_uxn_device_h_l57_c20_c21f_iffalse,
MUX_uxn_device_h_l57_c20_c21f_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_bf13
BIN_OP_EQ_uxn_device_h_l64_c11_bf13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left,
BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right,
BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- y_MUX_uxn_device_h_l64_c7_2bba
y_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_2bba_cond,
y_MUX_uxn_device_h_l64_c7_2bba_iftrue,
y_MUX_uxn_device_h_l64_c7_2bba_iffalse,
y_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_2bba
result_vram_address_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba
result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_2bba
result_vram_value_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba
result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba
result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_2bba
auto_advance_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond,
auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- x_MUX_uxn_device_h_l64_c7_2bba
x_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_2bba_cond,
x_MUX_uxn_device_h_l64_c7_2bba_iftrue,
x_MUX_uxn_device_h_l64_c7_2bba_iffalse,
x_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_2bba
sprite_MUX_uxn_device_h_l64_c7_2bba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_2bba_cond,
sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue,
sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse,
sprite_MUX_uxn_device_h_l64_c7_2bba_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_a66f
BIN_OP_EQ_uxn_device_h_l65_c7_a66f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left,
BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right,
BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8
result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8
result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_9233
BIN_OP_EQ_uxn_device_h_l72_c11_9233 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_9233_left,
BIN_OP_EQ_uxn_device_h_l72_c11_9233_right,
BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- y_MUX_uxn_device_h_l72_c7_c32d
y_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_c32d_cond,
y_MUX_uxn_device_h_l72_c7_c32d_iftrue,
y_MUX_uxn_device_h_l72_c7_c32d_iffalse,
y_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_c32d
result_vram_address_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d
result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_c32d
result_vram_value_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d
result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d
result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_c32d
auto_advance_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond,
auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- x_MUX_uxn_device_h_l72_c7_c32d
x_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_c32d_cond,
x_MUX_uxn_device_h_l72_c7_c32d_iftrue,
x_MUX_uxn_device_h_l72_c7_c32d_iffalse,
x_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_c32d
sprite_MUX_uxn_device_h_l72_c7_c32d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_c32d_cond,
sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue,
sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse,
sprite_MUX_uxn_device_h_l72_c7_c32d_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_9787
BIN_OP_EQ_uxn_device_h_l73_c7_9787 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_9787_left,
BIN_OP_EQ_uxn_device_h_l73_c7_9787_right,
BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b
result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b
result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_4c6b
sprite_MUX_uxn_device_h_l73_c3_4c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_4c6b_cond,
sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue,
sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse,
sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_988f
BIN_OP_EQ_uxn_device_h_l81_c11_988f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_988f_left,
BIN_OP_EQ_uxn_device_h_l81_c11_988f_right,
BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- y_MUX_uxn_device_h_l81_c7_0b96
y_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_0b96_cond,
y_MUX_uxn_device_h_l81_c7_0b96_iftrue,
y_MUX_uxn_device_h_l81_c7_0b96_iffalse,
y_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_0b96
result_vram_address_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96
result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_0b96
result_vram_value_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96
result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96
result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_0b96
auto_advance_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond,
auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- x_MUX_uxn_device_h_l81_c7_0b96
x_MUX_uxn_device_h_l81_c7_0b96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_0b96_cond,
x_MUX_uxn_device_h_l81_c7_0b96_iftrue,
x_MUX_uxn_device_h_l81_c7_0b96_iffalse,
x_MUX_uxn_device_h_l81_c7_0b96_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_12d9
BIN_OP_EQ_uxn_device_h_l82_c7_12d9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left,
BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right,
BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_731a
result_is_deo_done_MUX_uxn_device_h_l82_c3_731a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_731a
result_device_ram_address_MUX_uxn_device_h_l82_c3_731a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_4d0a
BIN_OP_EQ_uxn_device_h_l89_c11_4d0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left,
BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right,
BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- y_MUX_uxn_device_h_l89_c7_2e97
y_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_2e97_cond,
y_MUX_uxn_device_h_l89_c7_2e97_iftrue,
y_MUX_uxn_device_h_l89_c7_2e97_iffalse,
y_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_2e97
result_vram_address_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97
result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_2e97
result_vram_value_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97
result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97
result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_2e97
auto_advance_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond,
auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- x_MUX_uxn_device_h_l89_c7_2e97
x_MUX_uxn_device_h_l89_c7_2e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_2e97_cond,
x_MUX_uxn_device_h_l89_c7_2e97_iftrue,
x_MUX_uxn_device_h_l89_c7_2e97_iffalse,
x_MUX_uxn_device_h_l89_c7_2e97_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_c5dd
BIN_OP_EQ_uxn_device_h_l90_c7_c5dd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left,
BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right,
BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_d788
result_is_deo_done_MUX_uxn_device_h_l90_c3_d788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_d788
result_device_ram_address_MUX_uxn_device_h_l90_c3_d788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output);

-- x_MUX_uxn_device_h_l90_c3_d788
x_MUX_uxn_device_h_l90_c3_d788 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_d788_cond,
x_MUX_uxn_device_h_l90_c3_d788_iftrue,
x_MUX_uxn_device_h_l90_c3_d788_iffalse,
x_MUX_uxn_device_h_l90_c3_d788_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_1e82
BIN_OP_EQ_uxn_device_h_l99_c11_1e82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left,
BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right,
BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output);

-- y_MUX_uxn_device_h_l99_c7_cb1f
y_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_cb1f_cond,
y_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
y_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
y_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_cb1f
result_vram_address_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f
result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_cb1f
result_vram_value_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f
result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f
result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_cb1f
auto_advance_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond,
auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- x_MUX_uxn_device_h_l99_c7_cb1f
x_MUX_uxn_device_h_l99_c7_cb1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_cb1f_cond,
x_MUX_uxn_device_h_l99_c7_cb1f_iftrue,
x_MUX_uxn_device_h_l99_c7_cb1f_iffalse,
x_MUX_uxn_device_h_l99_c7_cb1f_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_5321
BIN_OP_EQ_uxn_device_h_l100_c7_5321 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_5321_left,
BIN_OP_EQ_uxn_device_h_l100_c7_5321_right,
BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c
result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c
result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_8ad6
BIN_OP_EQ_uxn_device_h_l107_c11_8ad6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left,
BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right,
BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- y_MUX_uxn_device_h_l107_c7_d499
y_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_d499_cond,
y_MUX_uxn_device_h_l107_c7_d499_iftrue,
y_MUX_uxn_device_h_l107_c7_d499_iffalse,
y_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_d499
result_vram_address_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_d499
result_is_deo_done_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_d499
result_vram_value_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_d499
result_is_vram_write_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_d499
result_device_ram_address_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_d499
auto_advance_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_d499_cond,
auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output);

-- x_MUX_uxn_device_h_l107_c7_d499
x_MUX_uxn_device_h_l107_c7_d499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_d499_cond,
x_MUX_uxn_device_h_l107_c7_d499_iftrue,
x_MUX_uxn_device_h_l107_c7_d499_iffalse,
x_MUX_uxn_device_h_l107_c7_d499_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_a241
BIN_OP_EQ_uxn_device_h_l108_c7_a241 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_a241_left,
BIN_OP_EQ_uxn_device_h_l108_c7_a241_right,
BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7
result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7
result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output);

-- x_MUX_uxn_device_h_l108_c3_d1e7
x_MUX_uxn_device_h_l108_c3_d1e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_d1e7_cond,
x_MUX_uxn_device_h_l108_c3_d1e7_iftrue,
x_MUX_uxn_device_h_l108_c3_d1e7_iffalse,
x_MUX_uxn_device_h_l108_c3_d1e7_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_5521
BIN_OP_OR_uxn_device_h_l109_c4_5521 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_5521_left,
BIN_OP_OR_uxn_device_h_l109_c4_5521_right,
BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_f183
BIN_OP_EQ_uxn_device_h_l116_c11_f183 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_f183_left,
BIN_OP_EQ_uxn_device_h_l116_c11_f183_right,
BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output);

-- y_MUX_uxn_device_h_l116_c7_e0ef
y_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_e0ef_cond,
y_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
y_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
y_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_e0ef
result_vram_address_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef
result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_e0ef
result_vram_value_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef
result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef
result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_e0ef
auto_advance_MUX_uxn_device_h_l116_c7_e0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond,
auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_2925
BIN_OP_EQ_uxn_device_h_l117_c7_2925 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_2925_left,
BIN_OP_EQ_uxn_device_h_l117_c7_2925_right,
BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9
result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9
result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_8ddb
BIN_OP_EQ_uxn_device_h_l124_c11_8ddb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left,
BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right,
BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- y_MUX_uxn_device_h_l124_c7_4941
y_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_4941_cond,
y_MUX_uxn_device_h_l124_c7_4941_iftrue,
y_MUX_uxn_device_h_l124_c7_4941_iffalse,
y_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_4941
result_vram_address_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_4941
result_is_deo_done_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_4941
result_vram_value_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_4941
result_is_vram_write_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_4941
result_device_ram_address_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_4941
auto_advance_MUX_uxn_device_h_l124_c7_4941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_4941_cond,
auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_b0ba
BIN_OP_EQ_uxn_device_h_l125_c7_b0ba : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left,
BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right,
BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output);

-- y_MUX_uxn_device_h_l125_c3_5e95
y_MUX_uxn_device_h_l125_c3_5e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_5e95_cond,
y_MUX_uxn_device_h_l125_c3_5e95_iftrue,
y_MUX_uxn_device_h_l125_c3_5e95_iffalse,
y_MUX_uxn_device_h_l125_c3_5e95_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95
result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95
result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_f945
BIN_OP_EQ_uxn_device_h_l134_c11_f945 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_f945_left,
BIN_OP_EQ_uxn_device_h_l134_c11_f945_right,
BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- y_MUX_uxn_device_h_l134_c7_7a26
y_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_7a26_cond,
y_MUX_uxn_device_h_l134_c7_7a26_iftrue,
y_MUX_uxn_device_h_l134_c7_7a26_iffalse,
y_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_7a26
result_vram_address_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26
result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_7a26
result_vram_value_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26
result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26
result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_7a26
auto_advance_MUX_uxn_device_h_l134_c7_7a26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond,
auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_5b2d
BIN_OP_EQ_uxn_device_h_l135_c7_5b2d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left,
BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right,
BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8
result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8
result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_d6f9
BIN_OP_EQ_uxn_device_h_l142_c11_d6f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left,
BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right,
BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- y_MUX_uxn_device_h_l142_c7_ee82
y_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_ee82_cond,
y_MUX_uxn_device_h_l142_c7_ee82_iftrue,
y_MUX_uxn_device_h_l142_c7_ee82_iffalse,
y_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_ee82
result_vram_address_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82
result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_ee82
result_vram_value_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82
result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82
result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_ee82
auto_advance_MUX_uxn_device_h_l142_c7_ee82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond,
auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_d5e5
BIN_OP_EQ_uxn_device_h_l143_c7_d5e5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left,
BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right,
BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output);

-- y_MUX_uxn_device_h_l143_c3_303e
y_MUX_uxn_device_h_l143_c3_303e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_303e_cond,
y_MUX_uxn_device_h_l143_c3_303e_iftrue,
y_MUX_uxn_device_h_l143_c3_303e_iffalse,
y_MUX_uxn_device_h_l143_c3_303e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_303e
result_is_deo_done_MUX_uxn_device_h_l143_c3_303e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_303e
result_device_ram_address_MUX_uxn_device_h_l143_c3_303e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_c370
BIN_OP_OR_uxn_device_h_l144_c4_c370 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_c370_left,
BIN_OP_OR_uxn_device_h_l144_c4_c370_right,
BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_2535
BIN_OP_EQ_uxn_device_h_l151_c11_2535 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_2535_left,
BIN_OP_EQ_uxn_device_h_l151_c11_2535_right,
BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_bf36
result_vram_address_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36
result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_bf36
result_vram_value_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36
result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36
result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_bf36
auto_advance_MUX_uxn_device_h_l151_c7_bf36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond,
auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_05af
BIN_OP_EQ_uxn_device_h_l152_c7_05af : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_05af_left,
BIN_OP_EQ_uxn_device_h_l152_c7_05af_right,
BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34
result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34
result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c
BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_86d0
BIN_OP_GT_uxn_device_h_l153_c27_86d0 : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_86d0_left,
BIN_OP_GT_uxn_device_h_l153_c27_86d0_right,
BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output);

-- MUX_uxn_device_h_l153_c27_716e
MUX_uxn_device_h_l153_c27_716e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_716e_cond,
MUX_uxn_device_h_l153_c27_716e_iftrue,
MUX_uxn_device_h_l153_c27_716e_iffalse,
MUX_uxn_device_h_l153_c27_716e_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_f5cc
BIN_OP_EQ_uxn_device_h_l160_c11_f5cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left,
BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right,
BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_8d37
result_vram_address_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37
result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_8d37
result_vram_value_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37
result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37
result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_8d37
auto_advance_MUX_uxn_device_h_l160_c7_8d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond,
auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_9258
BIN_OP_EQ_uxn_device_h_l161_c7_9258 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_9258_left,
BIN_OP_EQ_uxn_device_h_l161_c7_9258_right,
BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_0ea6
result_vram_address_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6
result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_0ea6
result_vram_value_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6
result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6
result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_0ea6
auto_advance_MUX_uxn_device_h_l161_c3_0ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond,
auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output);

-- printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b
printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b : entity work.printf_uxn_device_h_l162_c4_c44b_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0,
printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1,
printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_0a74
BIN_OP_PLUS_uxn_device_h_l167_c27_0a74 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_4d81
BIN_OP_EQ_uxn_device_h_l173_c11_4d81 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left,
BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right,
BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_2cc7
result_vram_address_MUX_uxn_device_h_l173_c7_2cc7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7
result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7
result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_2cc7
result_vram_value_MUX_uxn_device_h_l173_c7_2cc7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_cd28
BIN_OP_EQ_uxn_device_h_l174_c7_cd28 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left,
BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right,
BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_9d94
result_vram_address_MUX_uxn_device_h_l174_c3_9d94 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94
result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_9d94
result_vram_value_MUX_uxn_device_h_l174_c3_9d94 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x,
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 y_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output,
 pixel_MUX_uxn_device_h_l35_c2_f733_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output,
 color_MUX_uxn_device_h_l35_c2_f733_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output,
 x_MUX_uxn_device_h_l35_c2_f733_return_output,
 sprite_MUX_uxn_device_h_l35_c2_f733_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output,
 y_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 color_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 x_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output,
 y_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output,
 pixel_MUX_uxn_device_h_l53_c7_2bff_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output,
 color_MUX_uxn_device_h_l53_c7_2bff_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output,
 x_MUX_uxn_device_h_l53_c7_2bff_return_output,
 sprite_MUX_uxn_device_h_l53_c7_2bff_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output,
 pixel_MUX_uxn_device_h_l54_c3_4212_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output,
 color_MUX_uxn_device_h_l54_c3_4212_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output,
 MUX_uxn_device_h_l57_c20_c21f_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output,
 y_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output,
 x_MUX_uxn_device_h_l64_c7_2bba_return_output,
 sprite_MUX_uxn_device_h_l64_c7_2bba_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output,
 y_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output,
 x_MUX_uxn_device_h_l72_c7_c32d_return_output,
 sprite_MUX_uxn_device_h_l72_c7_c32d_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output,
 sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output,
 y_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output,
 x_MUX_uxn_device_h_l81_c7_0b96_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 y_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output,
 x_MUX_uxn_device_h_l89_c7_2e97_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output,
 x_MUX_uxn_device_h_l90_c3_d788_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output,
 y_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 x_MUX_uxn_device_h_l99_c7_cb1f_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 y_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output,
 x_MUX_uxn_device_h_l107_c7_d499_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output,
 x_MUX_uxn_device_h_l108_c3_d1e7_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output,
 y_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output,
 y_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output,
 y_MUX_uxn_device_h_l125_c3_5e95_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output,
 y_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output,
 y_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output,
 y_MUX_uxn_device_h_l143_c3_303e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output,
 MUX_uxn_device_h_l153_c27_716e_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_f733_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_f733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_cd29 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_d8b2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_4212_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_55fc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_4212_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_4212_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_4212_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_be0d_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c21f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c21f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c21f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c21f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_a1f5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0b96_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_af0a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0b96_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0b96_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2e97_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0b96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_0914 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2e97_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_d788_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2e97_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_cb1f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_2e97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_dbcc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_d788_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_d788_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_d788_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_d499_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_4839 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_d499_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_d1e7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_d499_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_d499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_b895 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_d1e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_b964 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_d964 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_e60d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_0286 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_86f7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_716e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_716e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_716e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_716e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_27fd : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_359b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_1991_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_e313_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_0ffb_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_f780 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_dfc8 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_05cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_8b12_uxn_device_h_l26_l187_DUPLICATE_5a44_return_output : device_out_result_t;
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
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_right := to_unsigned(575999, 20);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l57_c20_c21f_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_af0a := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_af0a;
     VAR_result_device_ram_address_uxn_device_h_l119_c4_b964 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_b964;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_359b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_359b;
     VAR_result_vram_address_uxn_device_h_l177_c4_f780 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_f780;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right := to_unsigned(800, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right := to_unsigned(7, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_4839 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_4839;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_a1f5 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_a1f5;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_dbcc := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_dbcc;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_cd29 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_cd29;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_86f7 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_86f7;
     VAR_MUX_uxn_device_h_l153_c27_716e_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_0286 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_0286;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l137_c4_e60d := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_e60d;
     VAR_result_device_ram_address_uxn_device_h_l129_c4_d964 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_d964;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right := to_unsigned(8, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_right := to_unsigned(13, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right := to_unsigned(12, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_right := to_unsigned(9, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_right := to_unsigned(11, 4);
     VAR_MUX_uxn_device_h_l153_c27_716e_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right := to_unsigned(2, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_0914 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_0914;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_55fc := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_55fc;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_right := to_unsigned(5, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right := to_unsigned(6, 3);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_b895 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_b895;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right := to_unsigned(800, 10);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_d8b2 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_d8b2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue := to_unsigned(0, 1);
     VAR_result_vram_value_uxn_device_h_l178_c4_dfc8 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_dfc8;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right := to_unsigned(10, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l57_c20_c21f_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_f733_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_2bff_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_4212_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right := x;
     VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_d499_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_f733_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_2bff_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_2bba_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_c32d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_0b96_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_d788_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_left := y;
     VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_d499_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_5e95_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_7a26_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_ee82_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_303e_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_f733_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_2bff_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_2bba_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_c32d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_0b96_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_2e97_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l45_c11_4b1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_f183] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_f183_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_f183_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_0041] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_0041_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_left;
     BIN_OP_AND_uxn_device_h_l57_c20_0041_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output := BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c7_a241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_a241_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_a241_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output;

     -- BIN_OP_EQ[uxn_device_h_l173_c11_4d81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_f945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_f945_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_f945_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_d5e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_2925] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_2925_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_2925_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_f5cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_8ad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_8ddb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_be0d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_be0d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l89_c11_4d0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_073d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_073d_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_073d_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_0ffb] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_0ffb_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l65_c7_a66f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_9233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_9233_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_9233_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c7_b0ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_2535] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_2535_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_2535_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_9abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_e313] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_e313_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l100_c7_5321] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_5321_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_5321_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_c5dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_05cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_05cf_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l36_c7_b281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_b281_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_b281_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_12d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_05af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_05af_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_05af_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output := result.is_vram_write;

     -- printf_uxn_device_h_l33_c2_8251[uxn_device_h_l33_c2_8251] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0 <= VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg0;
     printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1 <= VAR_printf_uxn_device_h_l33_c2_8251_uxn_device_h_l33_c2_8251_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l81_c11_988f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_988f_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_988f_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_b050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_b050_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_b050_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;

     -- BIN_OP_EQ[uxn_device_h_l64_c11_bf13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_5b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l73_c7_9787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_9787_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_9787_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_1991] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_1991_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l142_c11_d6f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_1e82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_9258] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_9258_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_9258_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;

     -- BIN_OP_EQ[uxn_device_h_l46_c7_7747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_7747_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_7747_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_c97e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_cd28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_0041_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_5321_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_8ad6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_d1e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_a241_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_e0ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_f183_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_2925_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_4941_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_8ddb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_5e95_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b0ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_7a26_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_f945_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5b2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_ee82_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_d6f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_303e_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_d5e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_2535_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_05af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_f5cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_9258_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_4d81_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_cd28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_f733_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_073d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_b281_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_9a8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_4b1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7747_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_2bff_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_9abc_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b050_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2bba_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_bf13_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_a66f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c32d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_9233_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_9787_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_0b96_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_988f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_12d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_2e97_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_4d0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_d788_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_c5dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_1e82_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_c97e_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l109_l126_l91_l144_DUPLICATE_191e_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_4212_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_be0d_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_e313_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_0ffb_return_output;
     VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_1991_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l143_l82_l100_l65_l73_l46_l117_l161_l54_l90_l135_l108_l125_DUPLICATE_57e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_5123_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_05cf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_05cf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_6663_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_b184_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l173_l53_l107_l45_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_DUPLICATE_e227_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l143_l108_l82_l160_l100_l65_l73_l46_l117_l161_l54_l90_l135_l36_l152_l125_DUPLICATE_4971_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_2cc7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_b1d9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_5521] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_5521_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_left;
     BIN_OP_OR_uxn_device_h_l109_c4_5521_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output := BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_303e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_2289] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_731a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_9d94] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_4c6b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_303e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_4c6b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_34c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_5e95] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_f682] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output;

     -- color_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_color_MUX_uxn_device_h_l54_c3_4212_cond;
     color_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_4212_iftrue;
     color_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_4212_return_output := color_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_42c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_f682] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_2289] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_5d6c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_c370] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_c370_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_left;
     BIN_OP_OR_uxn_device_h_l144_c4_c370_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output := BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_d1e7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_bb34] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_303e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_5d6c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_bb34] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_5d6c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_2b2c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_b1d9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_d1e7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_5e95] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_34c8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_5e95] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_4212_cond;
     pixel_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_4212_return_output := pixel_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_9d94] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_d1e7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_9d94] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_731a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_abe8] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_e8e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_731a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_d788] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_2289] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_4c6b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_42c8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_42c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_2289] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_b1d9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_d788] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_f682] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output := auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_4c6b] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_4c6b_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_cond;
     sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output := sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output := CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_34c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_d788] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_c21f_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_e8e6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_abe8_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_5521_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_303e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_c370_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_2b2c_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_d788_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_5e95_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_2145_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_5d6c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_d1e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b1d9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_5e95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_42c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_303e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bb34_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_2289_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_f682_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_34c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_4c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_731a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_d788_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_5d6c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_d1e7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b1d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_5e95_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_42c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_303e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_2cc7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_2289_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_f682_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_34c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_4c6b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_731a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_d788_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_5d6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_d1e7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b1d9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_5e95_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_42c8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_303e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bb34_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_2289_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_f682_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_34c8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_4c6b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_731a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_d788_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_2289_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_9d94_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_9d94_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_9d94_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_4c6b_return_output;
     -- x_MUX[uxn_device_h_l90_c3_d788] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_d788_cond <= VAR_x_MUX_uxn_device_h_l90_c3_d788_cond;
     x_MUX_uxn_device_h_l90_c3_d788_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_d788_iftrue;
     x_MUX_uxn_device_h_l90_c3_d788_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_d788_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_d788_return_output := x_MUX_uxn_device_h_l90_c3_d788_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- MUX[uxn_device_h_l57_c20_c21f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_c21f_cond <= VAR_MUX_uxn_device_h_l57_c20_c21f_cond;
     MUX_uxn_device_h_l57_c20_c21f_iftrue <= VAR_MUX_uxn_device_h_l57_c20_c21f_iftrue;
     MUX_uxn_device_h_l57_c20_c21f_iffalse <= VAR_MUX_uxn_device_h_l57_c20_c21f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_c21f_return_output := MUX_uxn_device_h_l57_c20_c21f_return_output;

     -- x_MUX[uxn_device_h_l108_c3_d1e7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_d1e7_cond <= VAR_x_MUX_uxn_device_h_l108_c3_d1e7_cond;
     x_MUX_uxn_device_h_l108_c3_d1e7_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iftrue;
     x_MUX_uxn_device_h_l108_c3_d1e7_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_d1e7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_d1e7_return_output := x_MUX_uxn_device_h_l108_c3_d1e7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- y_MUX[uxn_device_h_l143_c3_303e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_303e_cond <= VAR_y_MUX_uxn_device_h_l143_c3_303e_cond;
     y_MUX_uxn_device_h_l143_c3_303e_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_303e_iftrue;
     y_MUX_uxn_device_h_l143_c3_303e_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_303e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_303e_return_output := y_MUX_uxn_device_h_l143_c3_303e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_2cc7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output;

     -- color_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_color_MUX_uxn_device_h_l53_c7_2bff_cond;
     color_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     color_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_2bff_return_output := color_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_2cc7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_cond;
     sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_return_output := sprite_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output := auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_2cc7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_86d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_86d0_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_left;
     BIN_OP_GT_uxn_device_h_l153_c27_86d0_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output := BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output;

     -- y_MUX[uxn_device_h_l125_c3_5e95] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_5e95_cond <= VAR_y_MUX_uxn_device_h_l125_c3_5e95_cond;
     y_MUX_uxn_device_h_l125_c3_5e95_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_5e95_iftrue;
     y_MUX_uxn_device_h_l125_c3_5e95_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_5e95_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_5e95_return_output := y_MUX_uxn_device_h_l125_c3_5e95_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_cond;
     pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_return_output := pixel_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_0a74] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_716e_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_86d0_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_27fd := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_0a74_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue := VAR_MUX_uxn_device_h_l57_c20_c21f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_2cc7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_2cc7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_2cc7_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_d499_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_d1e7_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2e97_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_d788_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_4941_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_5e95_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_ee82_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_303e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_27fd;
     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_cond;
     sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_return_output := sprite_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- color_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_color_MUX_uxn_device_h_l45_c7_9a8b_cond;
     color_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     color_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_9a8b_return_output := color_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_4212] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- x_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_x_MUX_uxn_device_h_l107_c7_d499_cond;
     x_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_d499_iftrue;
     x_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_d499_return_output := x_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- MUX[uxn_device_h_l153_c27_716e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_716e_cond <= VAR_MUX_uxn_device_h_l153_c27_716e_cond;
     MUX_uxn_device_h_l153_c27_716e_iftrue <= VAR_MUX_uxn_device_h_l153_c27_716e_iftrue;
     MUX_uxn_device_h_l153_c27_716e_iffalse <= VAR_MUX_uxn_device_h_l153_c27_716e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_716e_return_output := MUX_uxn_device_h_l153_c27_716e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- pixel_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_cond;
     pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output := pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- y_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_y_MUX_uxn_device_h_l142_c7_ee82_cond;
     y_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     y_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_ee82_return_output := y_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output := auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_0ea6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue := VAR_MUX_uxn_device_h_l153_c27_716e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_4212_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_0ea6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_ee82_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- y_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_y_MUX_uxn_device_h_l134_c7_7a26_cond;
     y_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     y_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_7a26_return_output := y_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_f733_cond;
     pixel_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_f733_return_output := pixel_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- color_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_color_MUX_uxn_device_h_l35_c2_f733_cond;
     color_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_f733_iftrue;
     color_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_f733_return_output := color_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output := auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- x_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_x_MUX_uxn_device_h_l99_c7_cb1f_cond;
     x_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     x_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_cb1f_return_output := x_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_cond;
     sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_return_output := sprite_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_bb34] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_ee82_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_2bff_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bb34_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_7a26_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output := auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_cond;
     sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output := sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- x_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_x_MUX_uxn_device_h_l89_c7_2e97_cond;
     x_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     x_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_2e97_return_output := x_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- y_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_y_MUX_uxn_device_h_l124_c7_4941_cond;
     y_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_4941_iftrue;
     y_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_4941_return_output := y_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_4941_return_output;
     -- result_vram_address_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- y_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_y_MUX_uxn_device_h_l116_c7_e0ef_cond;
     y_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     y_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_e0ef_return_output := y_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_f733_cond;
     sprite_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_f733_return_output := sprite_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output := auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- x_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_x_MUX_uxn_device_h_l81_c7_0b96_cond;
     x_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     x_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_0b96_return_output := x_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_4941_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_7a26_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     -- result_vram_value_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- x_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_x_MUX_uxn_device_h_l72_c7_c32d_cond;
     x_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     x_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_c32d_return_output := x_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- y_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_y_MUX_uxn_device_h_l107_c7_d499_cond;
     y_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_d499_iftrue;
     y_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_d499_return_output := y_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output := auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_d499_return_output;
     -- auto_advance_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output := auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- y_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_y_MUX_uxn_device_h_l99_c7_cb1f_cond;
     y_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     y_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_cb1f_return_output := y_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- x_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_x_MUX_uxn_device_h_l64_c7_2bba_cond;
     x_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     x_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_2bba_return_output := x_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- y_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_y_MUX_uxn_device_h_l89_c7_2e97_cond;
     y_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     y_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_2e97_return_output := y_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- x_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_x_MUX_uxn_device_h_l53_c7_2bff_cond;
     x_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     x_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_2bff_return_output := x_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output := auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_e0ef] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e0ef_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_2e97_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_4941] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- x_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_x_MUX_uxn_device_h_l45_c7_9a8b_cond;
     x_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     x_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_9a8b_return_output := x_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output := auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- y_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_y_MUX_uxn_device_h_l81_c7_0b96_cond;
     y_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     y_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_0b96_return_output := y_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_d499] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_4941_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_d499_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_0b96_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- y_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_y_MUX_uxn_device_h_l72_c7_c32d_cond;
     y_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     y_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_c32d_return_output := y_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_7a26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output := auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_cb1f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output;

     -- x_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_x_MUX_uxn_device_h_l35_c2_f733_cond;
     x_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_f733_iftrue;
     x_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_f733_return_output := x_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_7a26_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_cb1f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_2e97_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_c32d_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_2e97] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output := auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_ee82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output;

     -- y_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_y_MUX_uxn_device_h_l64_c7_2bba_cond;
     y_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     y_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_2bba_return_output := y_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_ee82_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_2e97_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_2bba_return_output;
     -- result_vram_value_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_bf36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_0b96] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output := auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- y_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_y_MUX_uxn_device_h_l53_c7_2bff_cond;
     y_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     y_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_2bff_return_output := y_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_bf36_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0b96_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_2bff_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_8d37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- y_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_y_MUX_uxn_device_h_l45_c7_9a8b_cond;
     y_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     y_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_9a8b_return_output := y_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output := auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_c32d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_8d37_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c32d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     -- result_vram_value_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_4c64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output;

     -- y_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_y_MUX_uxn_device_h_l35_c2_f733_cond;
     y_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_f733_iftrue;
     y_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_f733_return_output := y_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_2bba] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output := auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_4c64_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2bba_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_2bff_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_f733_return_output;
     -- auto_advance_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output := auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_a8c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_2bff] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_a8c9_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_f733_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_2bff_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- printf_uxn_device_h_l162_c4_c44b[uxn_device_h_l162_c4_c44b] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0 <= VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg0;
     printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1 <= VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg1;
     printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2 <= VAR_printf_uxn_device_h_l162_c4_c44b_uxn_device_h_l162_c4_c44b_arg2;
     -- Outputs

     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_9a8b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_9a8b_return_output;
     -- result_vram_address_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_f733] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_8b12_uxn_device_h_l26_l187_DUPLICATE_5a44 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_8b12_uxn_device_h_l26_l187_DUPLICATE_5a44_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8b12(
     result,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_f733_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_f733_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_8b12_uxn_device_h_l26_l187_DUPLICATE_5a44_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_8b12_uxn_device_h_l26_l187_DUPLICATE_5a44_return_output;
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
