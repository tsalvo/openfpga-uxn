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
-- Submodules: 271
entity screen_deo_0CLK_2944d99e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_2944d99e;
architecture arch of screen_deo_0CLK_2944d99e is
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
-- printf_uxn_device_h_l33_c2_f430[uxn_device_h_l33_c2_f430]
signal printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_e0e7]
signal BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_a4c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_9cb2]
signal auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l35_c2_9cb2]
signal color_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_9cb2]
signal pixel_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_9cb2]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_9cb2]
signal sprite_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l35_c2_9cb2]
signal y_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l35_c2_9cb2]
signal x_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_9cb2]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_9cb2]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_9cb2]
signal result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_9cb2]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_9cb2]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_9cb2]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_9cb2]
signal result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_7ba9]
signal BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_6d3a]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_6d3a]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_6d3a]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_6d3a]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_f339]
signal BIN_OP_EQ_uxn_device_h_l45_c11_f339_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_f339_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_0b1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_a4c8]
signal auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l45_c7_a4c8]
signal color_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_a4c8]
signal pixel_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_a4c8]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_a4c8]
signal sprite_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l45_c7_a4c8]
signal y_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l45_c7_a4c8]
signal x_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_a4c8]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_a4c8]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_a4c8]
signal result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_a4c8]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_a4c8]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_a4c8]
signal result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_3aa6]
signal BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_cf0b]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_cf0b]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_cf0b]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_7b6f]
signal BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_ead3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_0b1a]
signal auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l53_c7_0b1a]
signal color_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_0b1a]
signal pixel_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_0b1a]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_0b1a]
signal sprite_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l53_c7_0b1a]
signal y_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l53_c7_0b1a]
signal x_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_0b1a]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_0b1a]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_0b1a]
signal result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_0b1a]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_0b1a]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_0b1a]
signal result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_f681]
signal BIN_OP_EQ_uxn_device_h_l54_c7_f681_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_f681_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_8076]
signal color_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_8076]
signal pixel_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_8076]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_8076]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_8076]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_8076]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_34ed]
signal BIN_OP_AND_uxn_device_h_l57_c20_34ed_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_34ed_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_6ede]
signal BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_f597]
signal MUX_uxn_device_h_l57_c20_f597_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_f597_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_f597_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_f597_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_c13e]
signal BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c3a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_ead3]
signal auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_ead3]
signal sprite_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l64_c7_ead3]
signal y_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l64_c7_ead3]
signal x_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_ead3]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_ead3]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_ead3]
signal result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_ead3]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_ead3]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_ead3]
signal result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_37f0]
signal BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_28a4]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_28a4]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_28a4]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_4bcf]
signal BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_9e37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_c3a2]
signal auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_c3a2]
signal sprite_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l72_c7_c3a2]
signal y_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l72_c7_c3a2]
signal x_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_c3a2]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_c3a2]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_c3a2]
signal result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_c3a2]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c3a2]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_c3a2]
signal result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_d73a]
signal BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_c845]
signal sprite_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_c845]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_c845]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_c845]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_333b]
signal BIN_OP_EQ_uxn_device_h_l81_c11_333b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_333b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_3c2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_9e37]
signal auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c7_9e37]
signal y_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l81_c7_9e37]
signal x_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_9e37]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_9e37]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_9e37]
signal result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_9e37]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_9e37]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_9e37]
signal result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_b271]
signal BIN_OP_EQ_uxn_device_h_l82_c7_b271_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_b271_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_88b6]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_88b6]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_88b6]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_86f1]
signal BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_6776]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_3c2a]
signal auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l89_c7_3c2a]
signal y_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l89_c7_3c2a]
signal x_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_3c2a]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_3c2a]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_3c2a]
signal result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_3c2a]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_3c2a]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_3c2a]
signal result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_52f6]
signal BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c3_0b16]
signal x_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_0b16]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_0b16]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_0b16]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_ef52]
signal BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_afa8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_6776]
signal auto_advance_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l99_c7_6776]
signal y_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l99_c7_6776]
signal x_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_6776]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_6776]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_6776]
signal result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_6776]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_6776]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_6776]
signal result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_b57f]
signal BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_2d9f]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_2d9f]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_2d9f]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_ad59]
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_3445]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_afa8]
signal auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l107_c7_afa8]
signal y_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l107_c7_afa8]
signal x_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_afa8]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_afa8]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_afa8]
signal result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_afa8]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_afa8]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_afa8]
signal result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_160f]
signal BIN_OP_EQ_uxn_device_h_l108_c7_160f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_160f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c3_b31e]
signal x_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_b31e]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_b31e]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_b31e]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_d2e9]
signal BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_9532]
signal BIN_OP_EQ_uxn_device_h_l116_c11_9532_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_9532_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_8e79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_3445]
signal auto_advance_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_3445]
signal y_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_3445]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_3445]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_3445]
signal result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_3445]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_3445]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_3445]
signal result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_50fd]
signal BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_3aab]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_3aab]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_3aab]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_3e58]
signal BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_02ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_8e79]
signal auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l124_c7_8e79]
signal y_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_8e79]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_8e79]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_8e79]
signal result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_8e79]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_8e79]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_8e79]
signal result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_3fec]
signal BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_55dc]
signal y_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_55dc]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_55dc]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_55dc]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_5cbf]
signal BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_dcf2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_02ab]
signal auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l134_c7_02ab]
signal y_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_02ab]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_02ab]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_02ab]
signal result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_02ab]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_02ab]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_02ab]
signal result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_bcc1]
signal BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_6d3b]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_6d3b]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_6d3b]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_dccf]
signal BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_9500]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_dcf2]
signal auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l142_c7_dcf2]
signal y_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_dcf2]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_dcf2]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_dcf2]
signal result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_dcf2]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_dcf2]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_dcf2]
signal result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_5d95]
signal BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_4514]
signal y_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_4514]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_4514]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_4514]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_fd13]
signal BIN_OP_OR_uxn_device_h_l144_c4_fd13_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_fd13_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_3a6d]
signal BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l159_c7_27b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_9500]
signal auto_advance_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_9500]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_9500]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_9500]
signal result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_9500]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_9500]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_9500]
signal result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_6c3f]
signal BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_3e69]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_3e69]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_3e69]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l159_c11_d4f9]
signal BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l159_c1_a47c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l159_c7_27b4]
signal auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l159_c7_27b4]
signal result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l159_c7_27b4]
signal result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l159_c7_27b4]
signal result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l159_c7_27b4]
signal result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l159_c7_27b4]
signal result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l159_c7_27b4]
signal result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c7_015f]
signal BIN_OP_EQ_uxn_device_h_l160_c7_015f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c7_015f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_3295]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c3_a18f]
signal auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c3_a18f]
signal result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c3_a18f]
signal result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c3_a18f]
signal result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c3_a18f]
signal result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c3_a18f]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c3_a18f]
signal result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(31 downto 0);

-- printf_uxn_device_h_l161_c4_b356[uxn_device_h_l161_c4_b356]
signal printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l166_c27_78f4]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l166_c27_63fa]
signal BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l172_c11_7ca8]
signal BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l172_c7_fbdd]
signal result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l172_c7_fbdd]
signal result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l172_c7_fbdd]
signal result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l172_c7_fbdd]
signal result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c7_e9d1]
signal BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c3_cc46]
signal result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c3_cc46]
signal result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c3_cc46]
signal result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(1 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_a85d( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.vram_address := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430
printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430 : entity work.printf_uxn_device_h_l33_c2_f430_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0,
printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_e0e7
BIN_OP_EQ_uxn_device_h_l35_c6_e0e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left,
BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right,
BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_9cb2
auto_advance_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond,
auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- color_MUX_uxn_device_h_l35_c2_9cb2
color_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_9cb2_cond,
color_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
color_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
color_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_9cb2
pixel_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_9cb2_cond,
pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2
is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_9cb2
sprite_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_9cb2_cond,
sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- y_MUX_uxn_device_h_l35_c2_9cb2
y_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_9cb2_cond,
y_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
y_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
y_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- x_MUX_uxn_device_h_l35_c2_9cb2
x_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_9cb2_cond,
x_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
x_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
x_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2
result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2
result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_9cb2
result_vram_value_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2
result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_9cb2
result_vram_address_MUX_uxn_device_h_l35_c2_9cb2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_7ba9
BIN_OP_EQ_uxn_device_h_l36_c7_7ba9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left,
BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right,
BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a
result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a
result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_f339
BIN_OP_EQ_uxn_device_h_l45_c11_f339 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_f339_left,
BIN_OP_EQ_uxn_device_h_l45_c11_f339_right,
BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_a4c8
auto_advance_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond,
auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- color_MUX_uxn_device_h_l45_c7_a4c8
color_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_a4c8_cond,
color_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
color_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
color_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_a4c8
pixel_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_a4c8_cond,
pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8
is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_a4c8
sprite_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_a4c8_cond,
sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- y_MUX_uxn_device_h_l45_c7_a4c8
y_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_a4c8_cond,
y_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
y_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
y_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- x_MUX_uxn_device_h_l45_c7_a4c8
x_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_a4c8_cond,
x_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
x_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
x_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8
result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8
result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_a4c8
result_vram_value_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8
result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_a4c8
result_vram_address_MUX_uxn_device_h_l45_c7_a4c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_3aa6
BIN_OP_EQ_uxn_device_h_l46_c7_3aa6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left,
BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right,
BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b
result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b
result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_7b6f
BIN_OP_EQ_uxn_device_h_l53_c11_7b6f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left,
BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right,
BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_0b1a
auto_advance_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond,
auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- color_MUX_uxn_device_h_l53_c7_0b1a
color_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_0b1a_cond,
color_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
color_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
color_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_0b1a
pixel_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_0b1a_cond,
pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a
is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_0b1a
sprite_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_0b1a_cond,
sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- y_MUX_uxn_device_h_l53_c7_0b1a
y_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_0b1a_cond,
y_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
y_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
y_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- x_MUX_uxn_device_h_l53_c7_0b1a
x_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_0b1a_cond,
x_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
x_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
x_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a
result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a
result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_0b1a
result_vram_value_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a
result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_0b1a
result_vram_address_MUX_uxn_device_h_l53_c7_0b1a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_f681
BIN_OP_EQ_uxn_device_h_l54_c7_f681 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_f681_left,
BIN_OP_EQ_uxn_device_h_l54_c7_f681_right,
BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output);

-- color_MUX_uxn_device_h_l54_c3_8076
color_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_8076_cond,
color_MUX_uxn_device_h_l54_c3_8076_iftrue,
color_MUX_uxn_device_h_l54_c3_8076_iffalse,
color_MUX_uxn_device_h_l54_c3_8076_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_8076
pixel_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_8076_cond,
pixel_MUX_uxn_device_h_l54_c3_8076_iftrue,
pixel_MUX_uxn_device_h_l54_c3_8076_iffalse,
pixel_MUX_uxn_device_h_l54_c3_8076_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_8076
is_fill_mode_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_8076
result_device_ram_address_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_8076
result_is_deo_done_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_34ed
BIN_OP_AND_uxn_device_h_l57_c20_34ed : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_34ed_left,
BIN_OP_AND_uxn_device_h_l57_c20_34ed_right,
BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_6ede
BIN_OP_EQ_uxn_device_h_l57_c20_6ede : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left,
BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right,
BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output);

-- MUX_uxn_device_h_l57_c20_f597
MUX_uxn_device_h_l57_c20_f597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_f597_cond,
MUX_uxn_device_h_l57_c20_f597_iftrue,
MUX_uxn_device_h_l57_c20_f597_iffalse,
MUX_uxn_device_h_l57_c20_f597_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_c13e
BIN_OP_EQ_uxn_device_h_l64_c11_c13e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left,
BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right,
BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_ead3
auto_advance_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond,
auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_ead3
sprite_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_ead3_cond,
sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue,
sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse,
sprite_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- y_MUX_uxn_device_h_l64_c7_ead3
y_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_ead3_cond,
y_MUX_uxn_device_h_l64_c7_ead3_iftrue,
y_MUX_uxn_device_h_l64_c7_ead3_iffalse,
y_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- x_MUX_uxn_device_h_l64_c7_ead3
x_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_ead3_cond,
x_MUX_uxn_device_h_l64_c7_ead3_iftrue,
x_MUX_uxn_device_h_l64_c7_ead3_iffalse,
x_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3
result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3
result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_ead3
result_vram_value_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3
result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_ead3
result_vram_address_MUX_uxn_device_h_l64_c7_ead3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_37f0
BIN_OP_EQ_uxn_device_h_l65_c7_37f0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left,
BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right,
BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4
result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4
result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_4bcf
BIN_OP_EQ_uxn_device_h_l72_c11_4bcf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left,
BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right,
BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_c3a2
auto_advance_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond,
auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_c3a2
sprite_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_c3a2_cond,
sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- y_MUX_uxn_device_h_l72_c7_c3a2
y_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_c3a2_cond,
y_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
y_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
y_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- x_MUX_uxn_device_h_l72_c7_c3a2
x_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_c3a2_cond,
x_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
x_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
x_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2
result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2
result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_c3a2
result_vram_value_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2
result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_c3a2
result_vram_address_MUX_uxn_device_h_l72_c7_c3a2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_d73a
BIN_OP_EQ_uxn_device_h_l73_c7_d73a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left,
BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right,
BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_c845
sprite_MUX_uxn_device_h_l73_c3_c845 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_c845_cond,
sprite_MUX_uxn_device_h_l73_c3_c845_iftrue,
sprite_MUX_uxn_device_h_l73_c3_c845_iffalse,
sprite_MUX_uxn_device_h_l73_c3_c845_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_c845
result_device_ram_address_MUX_uxn_device_h_l73_c3_c845 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_c845
result_is_deo_done_MUX_uxn_device_h_l73_c3_c845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_333b
BIN_OP_EQ_uxn_device_h_l81_c11_333b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_333b_left,
BIN_OP_EQ_uxn_device_h_l81_c11_333b_right,
BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_9e37
auto_advance_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond,
auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- y_MUX_uxn_device_h_l81_c7_9e37
y_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_9e37_cond,
y_MUX_uxn_device_h_l81_c7_9e37_iftrue,
y_MUX_uxn_device_h_l81_c7_9e37_iffalse,
y_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- x_MUX_uxn_device_h_l81_c7_9e37
x_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_9e37_cond,
x_MUX_uxn_device_h_l81_c7_9e37_iftrue,
x_MUX_uxn_device_h_l81_c7_9e37_iffalse,
x_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37
result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37
result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_9e37
result_vram_value_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37
result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_9e37
result_vram_address_MUX_uxn_device_h_l81_c7_9e37 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_b271
BIN_OP_EQ_uxn_device_h_l82_c7_b271 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_b271_left,
BIN_OP_EQ_uxn_device_h_l82_c7_b271_right,
BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6
result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6
result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_86f1
BIN_OP_EQ_uxn_device_h_l89_c11_86f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left,
BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right,
BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_3c2a
auto_advance_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond,
auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- y_MUX_uxn_device_h_l89_c7_3c2a
y_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_3c2a_cond,
y_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
y_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
y_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- x_MUX_uxn_device_h_l89_c7_3c2a
x_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_3c2a_cond,
x_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
x_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
x_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a
result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a
result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_3c2a
result_vram_value_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a
result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_3c2a
result_vram_address_MUX_uxn_device_h_l89_c7_3c2a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_52f6
BIN_OP_EQ_uxn_device_h_l90_c7_52f6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left,
BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right,
BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output);

-- x_MUX_uxn_device_h_l90_c3_0b16
x_MUX_uxn_device_h_l90_c3_0b16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_0b16_cond,
x_MUX_uxn_device_h_l90_c3_0b16_iftrue,
x_MUX_uxn_device_h_l90_c3_0b16_iffalse,
x_MUX_uxn_device_h_l90_c3_0b16_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16
result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16
result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_ef52
BIN_OP_EQ_uxn_device_h_l99_c11_ef52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left,
BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right,
BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_6776
auto_advance_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_6776_cond,
auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output);

-- y_MUX_uxn_device_h_l99_c7_6776
y_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_6776_cond,
y_MUX_uxn_device_h_l99_c7_6776_iftrue,
y_MUX_uxn_device_h_l99_c7_6776_iffalse,
y_MUX_uxn_device_h_l99_c7_6776_return_output);

-- x_MUX_uxn_device_h_l99_c7_6776
x_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_6776_cond,
x_MUX_uxn_device_h_l99_c7_6776_iftrue,
x_MUX_uxn_device_h_l99_c7_6776_iffalse,
x_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_6776
result_device_ram_address_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_6776
result_is_vram_write_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_6776
result_vram_value_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_6776
result_is_deo_done_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_6776
result_vram_address_MUX_uxn_device_h_l99_c7_6776 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_b57f
BIN_OP_EQ_uxn_device_h_l100_c7_b57f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left,
BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right,
BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f
result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f
result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_ad59
BIN_OP_EQ_uxn_device_h_l107_c11_ad59 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left,
BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right,
BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_afa8
auto_advance_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond,
auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- y_MUX_uxn_device_h_l107_c7_afa8
y_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_afa8_cond,
y_MUX_uxn_device_h_l107_c7_afa8_iftrue,
y_MUX_uxn_device_h_l107_c7_afa8_iffalse,
y_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- x_MUX_uxn_device_h_l107_c7_afa8
x_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_afa8_cond,
x_MUX_uxn_device_h_l107_c7_afa8_iftrue,
x_MUX_uxn_device_h_l107_c7_afa8_iffalse,
x_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8
result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8
result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_afa8
result_vram_value_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8
result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_afa8
result_vram_address_MUX_uxn_device_h_l107_c7_afa8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_160f
BIN_OP_EQ_uxn_device_h_l108_c7_160f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_160f_left,
BIN_OP_EQ_uxn_device_h_l108_c7_160f_right,
BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output);

-- x_MUX_uxn_device_h_l108_c3_b31e
x_MUX_uxn_device_h_l108_c3_b31e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_b31e_cond,
x_MUX_uxn_device_h_l108_c3_b31e_iftrue,
x_MUX_uxn_device_h_l108_c3_b31e_iffalse,
x_MUX_uxn_device_h_l108_c3_b31e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e
result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e
result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_d2e9
BIN_OP_OR_uxn_device_h_l109_c4_d2e9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left,
BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right,
BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_9532
BIN_OP_EQ_uxn_device_h_l116_c11_9532 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_9532_left,
BIN_OP_EQ_uxn_device_h_l116_c11_9532_right,
BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_3445
auto_advance_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_3445_cond,
auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output);

-- y_MUX_uxn_device_h_l116_c7_3445
y_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_3445_cond,
y_MUX_uxn_device_h_l116_c7_3445_iftrue,
y_MUX_uxn_device_h_l116_c7_3445_iffalse,
y_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_3445
result_device_ram_address_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_3445
result_is_vram_write_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_3445
result_vram_value_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_3445
result_is_deo_done_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_3445
result_vram_address_MUX_uxn_device_h_l116_c7_3445 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_50fd
BIN_OP_EQ_uxn_device_h_l117_c7_50fd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left,
BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right,
BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab
result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab
result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_3e58
BIN_OP_EQ_uxn_device_h_l124_c11_3e58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left,
BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right,
BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_8e79
auto_advance_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond,
auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- y_MUX_uxn_device_h_l124_c7_8e79
y_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_8e79_cond,
y_MUX_uxn_device_h_l124_c7_8e79_iftrue,
y_MUX_uxn_device_h_l124_c7_8e79_iffalse,
y_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79
result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79
result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_8e79
result_vram_value_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79
result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_8e79
result_vram_address_MUX_uxn_device_h_l124_c7_8e79 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_3fec
BIN_OP_EQ_uxn_device_h_l125_c7_3fec : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left,
BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right,
BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output);

-- y_MUX_uxn_device_h_l125_c3_55dc
y_MUX_uxn_device_h_l125_c3_55dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_55dc_cond,
y_MUX_uxn_device_h_l125_c3_55dc_iftrue,
y_MUX_uxn_device_h_l125_c3_55dc_iffalse,
y_MUX_uxn_device_h_l125_c3_55dc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc
result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc
result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_5cbf
BIN_OP_EQ_uxn_device_h_l134_c11_5cbf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left,
BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right,
BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_02ab
auto_advance_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond,
auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- y_MUX_uxn_device_h_l134_c7_02ab
y_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_02ab_cond,
y_MUX_uxn_device_h_l134_c7_02ab_iftrue,
y_MUX_uxn_device_h_l134_c7_02ab_iffalse,
y_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab
result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab
result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_02ab
result_vram_value_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab
result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_02ab
result_vram_address_MUX_uxn_device_h_l134_c7_02ab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_bcc1
BIN_OP_EQ_uxn_device_h_l135_c7_bcc1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left,
BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right,
BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b
result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b
result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_dccf
BIN_OP_EQ_uxn_device_h_l142_c11_dccf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left,
BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right,
BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_dcf2
auto_advance_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond,
auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- y_MUX_uxn_device_h_l142_c7_dcf2
y_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_dcf2_cond,
y_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
y_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
y_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2
result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2
result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_dcf2
result_vram_value_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2
result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_dcf2
result_vram_address_MUX_uxn_device_h_l142_c7_dcf2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_5d95
BIN_OP_EQ_uxn_device_h_l143_c7_5d95 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left,
BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right,
BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output);

-- y_MUX_uxn_device_h_l143_c3_4514
y_MUX_uxn_device_h_l143_c3_4514 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_4514_cond,
y_MUX_uxn_device_h_l143_c3_4514_iftrue,
y_MUX_uxn_device_h_l143_c3_4514_iffalse,
y_MUX_uxn_device_h_l143_c3_4514_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_4514
result_device_ram_address_MUX_uxn_device_h_l143_c3_4514 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_4514
result_is_deo_done_MUX_uxn_device_h_l143_c3_4514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_fd13
BIN_OP_OR_uxn_device_h_l144_c4_fd13 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_fd13_left,
BIN_OP_OR_uxn_device_h_l144_c4_fd13_right,
BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_3a6d
BIN_OP_EQ_uxn_device_h_l151_c11_3a6d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left,
BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right,
BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_9500
auto_advance_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_9500_cond,
auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_9500
result_device_ram_address_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_9500
result_is_vram_write_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_9500
result_vram_value_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_9500
result_is_deo_done_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_9500
result_vram_address_MUX_uxn_device_h_l151_c7_9500 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_6c3f
BIN_OP_EQ_uxn_device_h_l152_c7_6c3f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left,
BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right,
BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69
result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69
result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output);

-- BIN_OP_EQ_uxn_device_h_l159_c11_d4f9
BIN_OP_EQ_uxn_device_h_l159_c11_d4f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left,
BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right,
BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output);

-- auto_advance_MUX_uxn_device_h_l159_c7_27b4
auto_advance_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond,
auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue,
auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse,
auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4
result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond,
result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4
result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond,
result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_vram_value_MUX_uxn_device_h_l159_c7_27b4
result_vram_value_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond,
result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4
result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond,
result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4
result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- result_vram_address_MUX_uxn_device_h_l159_c7_27b4
result_vram_address_MUX_uxn_device_h_l159_c7_27b4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond,
result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue,
result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse,
result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c7_015f
BIN_OP_EQ_uxn_device_h_l160_c7_015f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c7_015f_left,
BIN_OP_EQ_uxn_device_h_l160_c7_015f_right,
BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c3_a18f
auto_advance_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond,
auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue,
auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse,
auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f
result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f
result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c3_a18f
result_vram_value_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond,
result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f
result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f
result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c3_a18f
result_vram_address_MUX_uxn_device_h_l160_c3_a18f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond,
result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output);

-- printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356
printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356 : entity work.printf_uxn_device_h_l161_c4_b356_0CLK_de264c78 port map (
printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE,
printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0,
printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1,
printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4
BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l166_c27_63fa
BIN_OP_PLUS_uxn_device_h_l166_c27_63fa : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left,
BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right,
BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output);

-- BIN_OP_EQ_uxn_device_h_l172_c11_7ca8
BIN_OP_EQ_uxn_device_h_l172_c11_7ca8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left,
BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right,
BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd
result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond,
result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd
result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond,
result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output);

-- result_vram_address_MUX_uxn_device_h_l172_c7_fbdd
result_vram_address_MUX_uxn_device_h_l172_c7_fbdd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond,
result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue,
result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse,
result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output);

-- result_vram_value_MUX_uxn_device_h_l172_c7_fbdd
result_vram_value_MUX_uxn_device_h_l172_c7_fbdd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond,
result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue,
result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse,
result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c7_e9d1
BIN_OP_EQ_uxn_device_h_l173_c7_e9d1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left,
BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right,
BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46
result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c3_cc46
result_vram_address_MUX_uxn_device_h_l173_c3_cc46 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond,
result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c3_cc46
result_vram_value_MUX_uxn_device_h_l173_c3_cc46 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond,
result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x,
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 color_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 y_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 x_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 color_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 y_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 x_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 color_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 y_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 x_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output,
 color_MUX_uxn_device_h_l54_c3_8076_return_output,
 pixel_MUX_uxn_device_h_l54_c3_8076_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output,
 MUX_uxn_device_h_l57_c20_f597_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output,
 sprite_MUX_uxn_device_h_l64_c7_ead3_return_output,
 y_MUX_uxn_device_h_l64_c7_ead3_return_output,
 x_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 y_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 x_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output,
 sprite_MUX_uxn_device_h_l73_c3_c845_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output,
 y_MUX_uxn_device_h_l81_c7_9e37_return_output,
 x_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 y_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 x_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output,
 x_MUX_uxn_device_h_l90_c3_0b16_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output,
 y_MUX_uxn_device_h_l99_c7_6776_return_output,
 x_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output,
 y_MUX_uxn_device_h_l107_c7_afa8_return_output,
 x_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output,
 x_MUX_uxn_device_h_l108_c3_b31e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output,
 y_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output,
 y_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output,
 y_MUX_uxn_device_h_l125_c3_55dc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output,
 y_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 y_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output,
 y_MUX_uxn_device_h_l143_c3_4514_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output,
 BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output,
 auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output,
 result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output,
 auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output,
 BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output,
 BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output,
 result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output,
 result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_ea9a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_4abf : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_5f97 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_dbc1_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_f597_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_f597_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_f597_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_f597_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_1ccd : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_7799 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_1c87 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_8f42 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_3a74 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_a44e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_e670 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_b42d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_851a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_6335 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l154_c4_204d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l164_c4_fd39 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l166_c4_b107 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l161_c91_4434_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l166_c27_5b0e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l166_c63_9670_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l176_c4_39e7 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l177_c4_6849 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_378c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_a85d_uxn_device_h_l26_l186_DUPLICATE_346a_return_output : device_out_result_t;
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
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l57_c20_f597_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l164_c4_fd39 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue := VAR_result_device_ram_address_uxn_device_h_l164_c4_fd39;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right := to_unsigned(2, 2);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right := to_unsigned(8, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue := to_unsigned(1, 1);
     VAR_result_vram_value_uxn_device_h_l177_c4_6849 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue := VAR_result_vram_value_uxn_device_h_l177_c4_6849;
     VAR_result_device_ram_address_uxn_device_h_l146_c4_6335 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_6335;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_8f42 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_8f42;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_5f97 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_5f97;
     VAR_result_device_ram_address_uxn_device_h_l39_c4_ea9a := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_ea9a;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right := to_unsigned(11, 4);
     VAR_MUX_uxn_device_h_l57_c20_f597_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right := to_unsigned(13, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_a44e := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_a44e;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_4abf := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_4abf;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l137_c4_851a := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_851a;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right := to_unsigned(3, 2);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_1c87 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_1c87;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_1ccd := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_1ccd;
     VAR_result_vram_address_uxn_device_h_l176_c4_39e7 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue := VAR_result_vram_address_uxn_device_h_l176_c4_39e7;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_3a74 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_3a74;
     VAR_result_device_ram_address_uxn_device_h_l154_c4_204d := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue := VAR_result_device_ram_address_uxn_device_h_l154_c4_204d;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right := to_unsigned(320, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right := to_unsigned(6, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right := to_unsigned(7, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_7799 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_7799;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_e670 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_e670;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right := to_unsigned(10, 4);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_b42d := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_b42d;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_8076_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left := x;
     VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_afa8_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_b31e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_ead3_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_9e37_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_0b16_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_6776_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_left := y;
     VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_afa8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_3445_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_55dc_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_02ab_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_4514_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_ead3_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_9e37_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_6776_iftrue := y;
     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output := result.vram_address;

     -- CAST_TO_uint32_t[uxn_device_h_l166_c63_9670] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l166_c63_9670_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l89_c11_86f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l108_c7_160f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_160f_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_160f_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_378c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_378c_return_output := result.is_device_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l64_c11_c13e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l36_c7_7ba9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c7_d73a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_b57f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_3e58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_7b6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_e0e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_ad59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_ef52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_4bcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_52f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_dbc1] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_dbc1_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l160_c7_015f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c7_015f_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_left;
     BIN_OP_EQ_uxn_device_h_l160_c7_015f_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output := BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_dccf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l172_c11_7ca8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left <= VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_left;
     BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right <= VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output := BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_333b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_333b_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_333b_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_5cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_bcc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output;

     -- printf_uxn_device_h_l33_c2_f430[uxn_device_h_l33_c2_f430] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0 <= VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg0;
     printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1 <= VAR_printf_uxn_device_h_l33_c2_f430_uxn_device_h_l33_c2_f430_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l82_c7_b271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_b271_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_b271_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_34ed] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_34ed_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_left;
     BIN_OP_AND_uxn_device_h_l57_c20_34ed_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output := BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l166_c27_5b0e] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l166_c27_5b0e_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l125_c7_3fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_50fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_9532] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_9532_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_9532_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;

     -- BIN_OP_EQ[uxn_device_h_l173_c7_e9d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_left;
     BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output := BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l65_c7_37f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_3a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_5d95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output;

     -- BIN_OP_EQ[uxn_device_h_l159_c11_d4f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left <= VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_left;
     BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right <= VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output := BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l46_c7_3aa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_f681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_f681_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_f681_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_f339] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_f339_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_f339_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_6c3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l161_c91_4434] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l161_c91_4434_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_34ed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b57f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad59_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_b31e_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_160f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_3445_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9532_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_50fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_8e79_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_3e58_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_55dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_3fec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_02ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_5cbf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_bcc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_dccf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_4514_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_5d95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_3a6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_6c3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l159_c11_d4f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c7_015f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c11_7ca8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c7_e9d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_9cb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_e0e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_7ba9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_a4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_f339_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_3aa6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_0b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_7b6f_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_f681_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_c13e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_37f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c3a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_4bcf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_c845_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_d73a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_333b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_b271_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_3c2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_86f1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_0b16_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_52f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_6776_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_ef52_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l109_l91_l144_DUPLICATE_3c08_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_8076_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_dbc1_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left := VAR_CAST_TO_uint32_t_uxn_device_h_l166_c27_5b0e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right := VAR_CAST_TO_uint32_t_uxn_device_h_l166_c63_9670_return_output;
     VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l161_c91_4434_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l73_l46_l117_l90_l54_l160_l135_l108_l152_l125_l143_DUPLICATE_fff0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_fd6c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_378c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_378c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_d5c7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_75bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l172_l53_l107_l45_l173_l99_l151_l35_l89_l142_l160_l81_l134_l72_l124_l64_l116_DUPLICATE_62f7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l159_l100_l65_l73_l46_l117_l90_l54_l160_l135_l36_l108_l152_l125_l143_DUPLICATE_1a01_return_output;
     -- pixel_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_8076_cond;
     pixel_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_8076_return_output := pixel_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_55dc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_0b16] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_0b16] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_6d3b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_cf0b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_6ede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l166_c27_78f4] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_4514] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_55dc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_4514] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_2d9f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c3_cc46] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_cond;
     result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output := result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_fd13] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_fd13_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_left;
     BIN_OP_OR_uxn_device_h_l144_c4_fd13_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output := BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_88b6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_cond;
     auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output := auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_b31e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c3_cc46] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_cond;
     result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output := result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- color_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_color_MUX_uxn_device_h_l54_c3_8076_cond;
     color_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_8076_iftrue;
     color_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_8076_return_output := color_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c3_cc46] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_c845] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_c845_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_c845_cond;
     sprite_MUX_uxn_device_h_l73_c3_c845_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_c845_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_c845_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_c845_return_output := sprite_MUX_uxn_device_h_l73_c3_c845_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_4514] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_c845] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_88b6] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output := result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_3e69] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_cf0b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output := CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_28a4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_3aab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_2d9f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_55dc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_6d3a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_c845] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_6d3b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_3aab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_6d3a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_6d3a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_2d9f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_6d3a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_28a4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_6d3b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_0b16] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_88b6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_3e69] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_b31e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_28a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_3e69] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l172_c7_fbdd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_cond;
     result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output := result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_cf0b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_b31e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_3aab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_c845] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_d2e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_left;
     BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output := BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_f597_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_6ede_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l166_c27_78f4_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_b31e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_d2e9_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_4514_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_fd13_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_0b16_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_55dc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_1169_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_auto_advance_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_2d9f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_b31e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_3aab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_55dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_6d3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_4514_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3e69_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_6d3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_cf0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_28a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_c845_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_88b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_0b16_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_2d9f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_b31e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_3aab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_55dc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_6d3b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_4514_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3e69_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l172_c7_fbdd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_6d3a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_cf0b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_28a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_c845_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_88b6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_0b16_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_2d9f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_b31e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_3aab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_55dc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_6d3b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_4514_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3e69_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_6d3a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_cf0b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_28a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_c845_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_88b6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_0b16_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_6d3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c3_cc46_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l173_c3_cc46_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l173_c3_cc46_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_c845_return_output;
     -- color_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_color_MUX_uxn_device_h_l53_c7_0b1a_cond;
     color_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     color_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_0b1a_return_output := color_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l172_c7_fbdd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond <= VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_cond;
     result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iftrue;
     result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output := result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output;

     -- y_MUX[uxn_device_h_l143_c3_4514] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_4514_cond <= VAR_y_MUX_uxn_device_h_l143_c3_4514_cond;
     y_MUX_uxn_device_h_l143_c3_4514_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_4514_iftrue;
     y_MUX_uxn_device_h_l143_c3_4514_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_4514_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_4514_return_output := y_MUX_uxn_device_h_l143_c3_4514_return_output;

     -- result_vram_value_MUX[uxn_device_h_l172_c7_fbdd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond <= VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_cond;
     result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iftrue;
     result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output := result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l172_c7_fbdd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_cond;
     result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output := result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_cond;
     pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output := pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_cond;
     sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output := sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- auto_advance_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_cond;
     auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output := auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output := result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- x_MUX[uxn_device_h_l108_c3_b31e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_b31e_cond <= VAR_x_MUX_uxn_device_h_l108_c3_b31e_cond;
     x_MUX_uxn_device_h_l108_c3_b31e_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_b31e_iftrue;
     x_MUX_uxn_device_h_l108_c3_b31e_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_b31e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_b31e_return_output := x_MUX_uxn_device_h_l108_c3_b31e_return_output;

     -- MUX[uxn_device_h_l57_c20_f597] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_f597_cond <= VAR_MUX_uxn_device_h_l57_c20_f597_cond;
     MUX_uxn_device_h_l57_c20_f597_iftrue <= VAR_MUX_uxn_device_h_l57_c20_f597_iftrue;
     MUX_uxn_device_h_l57_c20_f597_iffalse <= VAR_MUX_uxn_device_h_l57_c20_f597_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_f597_return_output := MUX_uxn_device_h_l57_c20_f597_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l166_c27_63fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left <= VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_left;
     BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right <= VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output := BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output;

     -- x_MUX[uxn_device_h_l90_c3_0b16] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_0b16_cond <= VAR_x_MUX_uxn_device_h_l90_c3_0b16_cond;
     x_MUX_uxn_device_h_l90_c3_0b16_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_0b16_iftrue;
     x_MUX_uxn_device_h_l90_c3_0b16_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_0b16_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_0b16_return_output := x_MUX_uxn_device_h_l90_c3_0b16_return_output;

     -- y_MUX[uxn_device_h_l125_c3_55dc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_55dc_cond <= VAR_y_MUX_uxn_device_h_l125_c3_55dc_cond;
     y_MUX_uxn_device_h_l125_c3_55dc_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_55dc_iftrue;
     y_MUX_uxn_device_h_l125_c3_55dc_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_55dc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_55dc_return_output := y_MUX_uxn_device_h_l125_c3_55dc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output := result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- Submodule level 3
     VAR_result_vram_address_uxn_device_h_l166_c4_b107 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l166_c27_63fa_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue := VAR_MUX_uxn_device_h_l57_c20_f597_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_auto_advance_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l172_c7_fbdd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l172_c7_fbdd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l172_c7_fbdd_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_afa8_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_b31e_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_0b16_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_8e79_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_55dc_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_4514_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue := VAR_result_vram_address_uxn_device_h_l166_c4_b107;
     -- pixel_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_cond;
     pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output := pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_cond;
     sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_return_output := sprite_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output := auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- result_vram_value_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output := result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_8076] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output;

     -- color_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_color_MUX_uxn_device_h_l45_c7_a4c8_cond;
     color_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     color_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_a4c8_return_output := color_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output := result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- y_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_y_MUX_uxn_device_h_l142_c7_dcf2_cond;
     y_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     y_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_dcf2_return_output := y_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- x_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_x_MUX_uxn_device_h_l107_c7_afa8_cond;
     x_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     x_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_afa8_return_output := x_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c3_a18f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_cond;
     result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output := result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_8076_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l160_c3_a18f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     -- result_vram_value_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- color_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_color_MUX_uxn_device_h_l35_c2_9cb2_cond;
     color_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     color_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_9cb2_return_output := color_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- y_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_y_MUX_uxn_device_h_l134_c7_02ab_cond;
     y_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     y_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_02ab_return_output := y_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_cond;
     sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output := sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output := auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_cond;
     pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output := pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- x_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_x_MUX_uxn_device_h_l99_c7_6776_cond;
     x_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_6776_iftrue;
     x_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_6776_return_output := x_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- result_vram_address_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_cond;
     result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output := result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_02ab_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output := auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_cond;
     sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output := sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- y_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_y_MUX_uxn_device_h_l124_c7_8e79_cond;
     y_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     y_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_8e79_return_output := y_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- x_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_x_MUX_uxn_device_h_l89_c7_3c2a_cond;
     x_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     x_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_3c2a_return_output := x_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_8e79_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- x_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_x_MUX_uxn_device_h_l81_c7_9e37_cond;
     x_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     x_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_9e37_return_output := x_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- y_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_y_MUX_uxn_device_h_l116_c7_3445_cond;
     y_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_3445_iftrue;
     y_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_3445_return_output := y_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output := auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_cond;
     sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output := sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_8e79_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_02ab_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_3445_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output := auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- x_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_x_MUX_uxn_device_h_l72_c7_c3a2_cond;
     x_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     x_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_c3a2_return_output := x_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- y_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_y_MUX_uxn_device_h_l107_c7_afa8_cond;
     y_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     y_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_afa8_return_output := y_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_vram_value_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_afa8_return_output;
     -- result_vram_address_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- x_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_x_MUX_uxn_device_h_l64_c7_ead3_cond;
     x_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     x_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_ead3_return_output := x_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- y_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_y_MUX_uxn_device_h_l99_c7_6776_cond;
     y_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_6776_iftrue;
     y_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_6776_return_output := y_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output := auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_6776_return_output;
     -- auto_advance_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output := auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- y_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_y_MUX_uxn_device_h_l89_c7_3c2a_cond;
     y_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     y_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_3c2a_return_output := y_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- x_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_x_MUX_uxn_device_h_l53_c7_0b1a_cond;
     x_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     x_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_0b1a_return_output := x_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_3445] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_3445_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     -- auto_advance_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output := auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_8e79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output;

     -- x_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_x_MUX_uxn_device_h_l45_c7_a4c8_cond;
     x_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     x_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_a4c8_return_output := x_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_afa8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- y_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_y_MUX_uxn_device_h_l81_c7_9e37_cond;
     y_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     y_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_9e37_return_output := y_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_8e79_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_afa8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_9e37_return_output;
     -- result_vram_value_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_02ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output;

     -- x_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_x_MUX_uxn_device_h_l35_c2_9cb2_cond;
     x_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     x_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_9cb2_return_output := x_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output := auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_6776] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output;

     -- y_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_y_MUX_uxn_device_h_l72_c7_c3a2_cond;
     y_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     y_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_c3a2_return_output := y_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_02ab_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_6776_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_dcf2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output;

     -- y_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_y_MUX_uxn_device_h_l64_c7_ead3_cond;
     y_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     y_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_ead3_return_output := y_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_3c2a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output := auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_dcf2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_3c2a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_ead3_return_output;
     -- y_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_y_MUX_uxn_device_h_l53_c7_0b1a_cond;
     y_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     y_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_0b1a_return_output := y_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output := auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_9e37] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_9500] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_9500_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_9e37_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     -- result_vram_address_MUX[uxn_device_h_l72_c7_c3a2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l159_c7_27b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output;

     -- y_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_y_MUX_uxn_device_h_l45_c7_a4c8_cond;
     y_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     y_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_a4c8_return_output := y_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output := auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c7_27b4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c3a2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     -- auto_advance_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output := auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- y_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_y_MUX_uxn_device_h_l35_c2_9cb2_cond;
     y_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     y_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_9cb2_return_output := y_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l159_c1_a47c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_ead3] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l159_c1_a47c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_ead3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_3295] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output := auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_0b1a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_3295_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_9cb2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_0b1a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     -- result_vram_address_MUX[uxn_device_h_l45_c7_a4c8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- printf_uxn_device_h_l161_c4_b356[uxn_device_h_l161_c4_b356] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0 <= VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg0;
     printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1 <= VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg1;
     printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2 <= VAR_printf_uxn_device_h_l161_c4_b356_uxn_device_h_l161_c4_b356_arg2;
     -- Outputs

     -- result_vram_value_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- Submodule level 18
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a4c8_return_output;
     -- result_vram_address_MUX[uxn_device_h_l35_c2_9cb2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_a85d_uxn_device_h_l26_l186_DUPLICATE_346a LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_a85d_uxn_device_h_l26_l186_DUPLICATE_346a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a85d(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_9cb2_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_9cb2_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_a85d_uxn_device_h_l26_l186_DUPLICATE_346a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_a85d_uxn_device_h_l26_l186_DUPLICATE_346a_return_output;
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
