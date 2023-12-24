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
-- Submodules: 193
entity screen_deo_0CLK_f4fa0157 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_f4fa0157;
architecture arch of screen_deo_0CLK_f4fa0157 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal is_pixel_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_sprite_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_drawing_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ram_addr : unsigned(15 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_is_pixel_port : unsigned(0 downto 0);
signal REG_COMB_is_sprite_port : unsigned(0 downto 0);
signal REG_COMB_is_drawing_port : unsigned(0 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_auto_x : unsigned(0 downto 0);
signal REG_COMB_is_auto_y : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l88_c6_0a6d]
signal BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_4e29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_09c5]
signal auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_09c5]
signal tmp8_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_09c5]
signal flip_x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_09c5]
signal is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_09c5]
signal y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_09c5]
signal flip_y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_09c5]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_09c5]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_09c5]
signal color_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_09c5]
signal ctrl_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_09c5]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l88_c2_09c5]
signal result_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_09c5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_09c5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_09c5_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l88_c2_09c5]
signal ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_09c5]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_09c5]
signal is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_09c5]
signal layer_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_09c5]
signal x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_8f33]
signal BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_e4bf]
signal MUX_uxn_device_h_l89_c19_e4bf_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_e4bf_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_e4bf_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_e4bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_5c81]
signal BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_0e6f]
signal MUX_uxn_device_h_l90_c20_0e6f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e6f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e6f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e6f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_6975]
signal BIN_OP_OR_uxn_device_h_l91_c21_6975_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_6975_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_31e5]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_31e5]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c32_1306]
signal MUX_uxn_device_h_l95_c32_1306_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_1306_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_1306_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_1306_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_2660]
signal BIN_OP_EQ_uxn_device_h_l101_c11_2660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_2660_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_7b77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_4e29]
signal auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_4e29]
signal tmp8_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_4e29]
signal flip_x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_4e29]
signal is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_4e29]
signal y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_4e29]
signal flip_y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l101_c7_4e29]
signal color_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_4e29]
signal ctrl_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l101_c7_4e29]
signal result_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_4e29_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_4e29_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_4e29_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l101_c7_4e29]
signal ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_4e29]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_4e29]
signal is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_4e29]
signal layer_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l101_c7_4e29]
signal x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_78c4]
signal BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_a372]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_7b77]
signal auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_7b77]
signal tmp8_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_7b77]
signal flip_x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_7b77]
signal is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l104_c7_7b77]
signal y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_7b77]
signal flip_y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l104_c7_7b77]
signal color_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(3 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_7b77]
signal ctrl_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l104_c7_7b77]
signal result_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_7b77_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_7b77_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_7b77_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l104_c7_7b77]
signal ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_7b77]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_7b77]
signal is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_7b77]
signal layer_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l104_c7_7b77]
signal x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_2235]
signal CONST_SR_7_uxn_device_h_l107_c25_2235_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_2235_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_aa52]
signal CONST_SR_6_uxn_device_h_l108_c21_aa52_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_7c8b]
signal CONST_SR_5_uxn_device_h_l109_c22_7c8b_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_111e]
signal CONST_SR_4_uxn_device_h_l110_c22_111e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_111e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_2fc1]
signal BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_ead4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_a372]
signal auto_advance_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_a372]
signal tmp8_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_a372]
signal is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l113_c7_a372]
signal y_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l113_c7_a372]
signal result_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_a372_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_a372_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_a372_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l113_c7_a372]
signal ram_addr_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_a372]
signal is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l113_c7_a372]
signal x_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_c21d]
signal BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_4956]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_ead4]
signal auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_ead4]
signal tmp8_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l117_c7_ead4]
signal is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l117_c7_ead4]
signal y_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l117_c7_ead4]
signal result_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_ead4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_ead4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_ead4_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l117_c7_ead4]
signal ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_ead4]
signal is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l117_c7_ead4]
signal x_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l119_c3_b099]
signal tmp8_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_b099]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_b099]
signal result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_b099]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_b099]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_b099]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_b099]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_bfc9]
signal BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_7bd8]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_2621]
signal tmp8_MUX_uxn_device_h_l125_c4_2621_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_2621_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_2621]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l126_c13_872c]
signal MUX_uxn_device_h_l126_c13_872c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_872c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_872c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_872c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_8612]
signal BIN_OP_OR_uxn_device_h_l126_c5_8612_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_8612_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_d1cb]
signal MUX_uxn_device_h_l127_c13_d1cb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_d1cb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_d1cb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_d1cb_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_436e]
signal BIN_OP_OR_uxn_device_h_l127_c5_436e_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_436e_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_2e81]
signal BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_d643]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_4956]
signal auto_advance_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l136_c7_4956]
signal is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l136_c7_4956]
signal y_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l136_c7_4956]
signal result_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_4956_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_4956_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_4956_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l136_c7_4956]
signal ram_addr_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l136_c7_4956]
signal is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l136_c7_4956]
signal x_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l139_c15_f1fc]
signal CONST_SR_1_uxn_device_h_l139_c15_f1fc_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l140_c3_11a4]
signal y_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_11a4]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_11a4]
signal result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_11a4]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_11a4]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_11a4]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_11a4]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l140_c3_11a4]
signal x_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l144_c4_4d3c]
signal y_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_4d3c]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_4d3c]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_4d3c]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_4d3c]
signal result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l144_c4_4d3c]
signal x_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_d402]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_65d8]
signal CONST_SR_8_uxn_device_h_l148_c33_65d8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l149_c11_99bf]
signal y_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_99bf]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_99bf]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_99bf]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_99bf]
signal result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_61c7]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_b934]
signal CONST_SR_8_uxn_device_h_l153_c33_b934_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_b934_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_3f76]
signal BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_e5b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l161_c7_d643]
signal y_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l161_c7_d643]
signal result_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_d643_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_d643_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_d643_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l161_c7_d643]
signal ram_addr_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l162_c3_5b19]
signal y_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_5b19]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_5b19]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_5b19]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_5b19]
signal result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l162_c3_5b19]
signal ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l163_c4_7aa3]
signal y_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_7aa3]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_7aa3]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_7aa3]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_7aa3]
signal result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_7a4f]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_42df]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_0494]
signal BIN_OP_EQ_uxn_device_h_l181_c11_0494_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0494_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_7a02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_e5b5]
signal result_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_e5b5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_e5b5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_e5b5_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l181_c7_e5b5]
signal ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_3b4a]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_3b4a]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_3b4a]
signal result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l182_c3_3b4a]
signal ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_0503]
signal CONST_SR_8_uxn_device_h_l186_c32_0503_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_0503_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_7880]
signal BIN_OP_OR_uxn_device_h_l189_c4_7880_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_7880_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_8faf]
signal BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_b289]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_7a02]
signal result_MUX_uxn_device_h_l192_c7_7a02_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_7a02_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_7a02_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_7a02_return_output : device_out_result_t;

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_7b15]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_7b15]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_7b15]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_7b15]
signal result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_cddd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_979e]
signal result_MUX_uxn_device_h_l202_c3_979e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_979e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_979e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_979e_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_36a8]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_592f]
signal screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_592f_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output : unsigned(15 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_56ba( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_027a( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_0486( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.is_deo_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_d252( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.is_deo_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.u8_value := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.u8_value := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base.is_device_ram_write := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_deo_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l88_c6_0a6d
BIN_OP_EQ_uxn_device_h_l88_c6_0a6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left,
BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right,
BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_09c5
auto_advance_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond,
auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_09c5
tmp8_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_09c5_cond,
tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_09c5
flip_x_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_09c5_cond,
flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_09c5
is_auto_x_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- y_MUX_uxn_device_h_l88_c2_09c5
y_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_09c5_cond,
y_MUX_uxn_device_h_l88_c2_09c5_iftrue,
y_MUX_uxn_device_h_l88_c2_09c5_iffalse,
y_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_09c5
flip_y_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_09c5_cond,
flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_09c5
is_drawing_port_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_09c5
is_pixel_port_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- color_MUX_uxn_device_h_l88_c2_09c5
color_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_09c5_cond,
color_MUX_uxn_device_h_l88_c2_09c5_iftrue,
color_MUX_uxn_device_h_l88_c2_09c5_iffalse,
color_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_09c5
ctrl_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_09c5_cond,
ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_09c5
is_sprite_port_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- result_MUX_uxn_device_h_l88_c2_09c5
result_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_09c5_cond,
result_MUX_uxn_device_h_l88_c2_09c5_iftrue,
result_MUX_uxn_device_h_l88_c2_09c5_iffalse,
result_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_09c5
ram_addr_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond,
ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_09c5
ctrl_mode_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_09c5
is_auto_y_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- layer_MUX_uxn_device_h_l88_c2_09c5
layer_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_09c5_cond,
layer_MUX_uxn_device_h_l88_c2_09c5_iftrue,
layer_MUX_uxn_device_h_l88_c2_09c5_iffalse,
layer_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- x_MUX_uxn_device_h_l88_c2_09c5
x_MUX_uxn_device_h_l88_c2_09c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_09c5_cond,
x_MUX_uxn_device_h_l88_c2_09c5_iftrue,
x_MUX_uxn_device_h_l88_c2_09c5_iffalse,
x_MUX_uxn_device_h_l88_c2_09c5_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_8f33
BIN_OP_EQ_uxn_device_h_l89_c19_8f33 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left,
BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right,
BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output);

-- MUX_uxn_device_h_l89_c19_e4bf
MUX_uxn_device_h_l89_c19_e4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_e4bf_cond,
MUX_uxn_device_h_l89_c19_e4bf_iftrue,
MUX_uxn_device_h_l89_c19_e4bf_iffalse,
MUX_uxn_device_h_l89_c19_e4bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_5c81
BIN_OP_EQ_uxn_device_h_l90_c20_5c81 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left,
BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right,
BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output);

-- MUX_uxn_device_h_l90_c20_0e6f
MUX_uxn_device_h_l90_c20_0e6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_0e6f_cond,
MUX_uxn_device_h_l90_c20_0e6f_iftrue,
MUX_uxn_device_h_l90_c20_0e6f_iffalse,
MUX_uxn_device_h_l90_c20_0e6f_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_6975
BIN_OP_OR_uxn_device_h_l91_c21_6975 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_6975_left,
BIN_OP_OR_uxn_device_h_l91_c21_6975_right,
BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5
result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5
result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output);

-- MUX_uxn_device_h_l95_c32_1306
MUX_uxn_device_h_l95_c32_1306 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_1306_cond,
MUX_uxn_device_h_l95_c32_1306_iftrue,
MUX_uxn_device_h_l95_c32_1306_iffalse,
MUX_uxn_device_h_l95_c32_1306_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_2660
BIN_OP_EQ_uxn_device_h_l101_c11_2660 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_2660_left,
BIN_OP_EQ_uxn_device_h_l101_c11_2660_right,
BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_4e29
auto_advance_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond,
auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_4e29
tmp8_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_4e29_cond,
tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_4e29
flip_x_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_4e29_cond,
flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_4e29
is_auto_x_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- y_MUX_uxn_device_h_l101_c7_4e29
y_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_4e29_cond,
y_MUX_uxn_device_h_l101_c7_4e29_iftrue,
y_MUX_uxn_device_h_l101_c7_4e29_iffalse,
y_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_4e29
flip_y_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_4e29_cond,
flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- color_MUX_uxn_device_h_l101_c7_4e29
color_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_4e29_cond,
color_MUX_uxn_device_h_l101_c7_4e29_iftrue,
color_MUX_uxn_device_h_l101_c7_4e29_iffalse,
color_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_4e29
ctrl_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_4e29_cond,
ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- result_MUX_uxn_device_h_l101_c7_4e29
result_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_4e29_cond,
result_MUX_uxn_device_h_l101_c7_4e29_iftrue,
result_MUX_uxn_device_h_l101_c7_4e29_iffalse,
result_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_4e29
ram_addr_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond,
ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_4e29
ctrl_mode_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_4e29
is_auto_y_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- layer_MUX_uxn_device_h_l101_c7_4e29
layer_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_4e29_cond,
layer_MUX_uxn_device_h_l101_c7_4e29_iftrue,
layer_MUX_uxn_device_h_l101_c7_4e29_iffalse,
layer_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- x_MUX_uxn_device_h_l101_c7_4e29
x_MUX_uxn_device_h_l101_c7_4e29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_4e29_cond,
x_MUX_uxn_device_h_l101_c7_4e29_iftrue,
x_MUX_uxn_device_h_l101_c7_4e29_iffalse,
x_MUX_uxn_device_h_l101_c7_4e29_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_78c4
BIN_OP_EQ_uxn_device_h_l104_c11_78c4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left,
BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right,
BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_7b77
auto_advance_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond,
auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_7b77
tmp8_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_7b77_cond,
tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_7b77
flip_x_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_7b77_cond,
flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_7b77
is_auto_x_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- y_MUX_uxn_device_h_l104_c7_7b77
y_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_7b77_cond,
y_MUX_uxn_device_h_l104_c7_7b77_iftrue,
y_MUX_uxn_device_h_l104_c7_7b77_iffalse,
y_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_7b77
flip_y_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_7b77_cond,
flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- color_MUX_uxn_device_h_l104_c7_7b77
color_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_7b77_cond,
color_MUX_uxn_device_h_l104_c7_7b77_iftrue,
color_MUX_uxn_device_h_l104_c7_7b77_iffalse,
color_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_7b77
ctrl_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_7b77_cond,
ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- result_MUX_uxn_device_h_l104_c7_7b77
result_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_7b77_cond,
result_MUX_uxn_device_h_l104_c7_7b77_iftrue,
result_MUX_uxn_device_h_l104_c7_7b77_iffalse,
result_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_7b77
ram_addr_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond,
ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_7b77
ctrl_mode_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_7b77
is_auto_y_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- layer_MUX_uxn_device_h_l104_c7_7b77
layer_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_7b77_cond,
layer_MUX_uxn_device_h_l104_c7_7b77_iftrue,
layer_MUX_uxn_device_h_l104_c7_7b77_iffalse,
layer_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- x_MUX_uxn_device_h_l104_c7_7b77
x_MUX_uxn_device_h_l104_c7_7b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_7b77_cond,
x_MUX_uxn_device_h_l104_c7_7b77_iftrue,
x_MUX_uxn_device_h_l104_c7_7b77_iffalse,
x_MUX_uxn_device_h_l104_c7_7b77_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_2235
CONST_SR_7_uxn_device_h_l107_c25_2235 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_2235_x,
CONST_SR_7_uxn_device_h_l107_c25_2235_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_aa52
CONST_SR_6_uxn_device_h_l108_c21_aa52 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_aa52_x,
CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_7c8b
CONST_SR_5_uxn_device_h_l109_c22_7c8b : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_7c8b_x,
CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_111e
CONST_SR_4_uxn_device_h_l110_c22_111e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_111e_x,
CONST_SR_4_uxn_device_h_l110_c22_111e_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_2fc1
BIN_OP_EQ_uxn_device_h_l113_c11_2fc1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left,
BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right,
BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_a372
auto_advance_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_a372_cond,
auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_a372
tmp8_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_a372_cond,
tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_a372_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_a372
is_auto_x_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output);

-- y_MUX_uxn_device_h_l113_c7_a372
y_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_a372_cond,
y_MUX_uxn_device_h_l113_c7_a372_iftrue,
y_MUX_uxn_device_h_l113_c7_a372_iffalse,
y_MUX_uxn_device_h_l113_c7_a372_return_output);

-- result_MUX_uxn_device_h_l113_c7_a372
result_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_a372_cond,
result_MUX_uxn_device_h_l113_c7_a372_iftrue,
result_MUX_uxn_device_h_l113_c7_a372_iffalse,
result_MUX_uxn_device_h_l113_c7_a372_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_a372
ram_addr_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_a372_cond,
ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_a372
is_auto_y_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output);

-- x_MUX_uxn_device_h_l113_c7_a372
x_MUX_uxn_device_h_l113_c7_a372 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_a372_cond,
x_MUX_uxn_device_h_l113_c7_a372_iftrue,
x_MUX_uxn_device_h_l113_c7_a372_iffalse,
x_MUX_uxn_device_h_l113_c7_a372_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_c21d
BIN_OP_EQ_uxn_device_h_l117_c11_c21d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left,
BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right,
BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_ead4
auto_advance_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond,
auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_ead4
tmp8_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_ead4_cond,
tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_ead4
is_auto_x_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- y_MUX_uxn_device_h_l117_c7_ead4
y_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_ead4_cond,
y_MUX_uxn_device_h_l117_c7_ead4_iftrue,
y_MUX_uxn_device_h_l117_c7_ead4_iffalse,
y_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- result_MUX_uxn_device_h_l117_c7_ead4
result_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_ead4_cond,
result_MUX_uxn_device_h_l117_c7_ead4_iftrue,
result_MUX_uxn_device_h_l117_c7_ead4_iffalse,
result_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_ead4
ram_addr_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond,
ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_ead4
is_auto_y_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- x_MUX_uxn_device_h_l117_c7_ead4
x_MUX_uxn_device_h_l117_c7_ead4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_ead4_cond,
x_MUX_uxn_device_h_l117_c7_ead4_iftrue,
x_MUX_uxn_device_h_l117_c7_ead4_iffalse,
x_MUX_uxn_device_h_l117_c7_ead4_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_b099
tmp8_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_b099_cond,
tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_b099
result_is_vram_write_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_b099
result_u8_value_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_b099
result_u16_addr_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_b099
result_device_ram_address_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099
result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_b099
result_is_deo_done_MUX_uxn_device_h_l119_c3_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_bfc9
BIN_OP_AND_uxn_device_h_l121_c11_bfc9 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left,
BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right,
BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8
BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_2621
tmp8_MUX_uxn_device_h_l125_c4_2621 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_2621_cond,
tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_2621_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_2621
result_is_deo_done_MUX_uxn_device_h_l125_c4_2621 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output);

-- MUX_uxn_device_h_l126_c13_872c
MUX_uxn_device_h_l126_c13_872c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_872c_cond,
MUX_uxn_device_h_l126_c13_872c_iftrue,
MUX_uxn_device_h_l126_c13_872c_iffalse,
MUX_uxn_device_h_l126_c13_872c_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_8612
BIN_OP_OR_uxn_device_h_l126_c5_8612 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_8612_left,
BIN_OP_OR_uxn_device_h_l126_c5_8612_right,
BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output);

-- MUX_uxn_device_h_l127_c13_d1cb
MUX_uxn_device_h_l127_c13_d1cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_d1cb_cond,
MUX_uxn_device_h_l127_c13_d1cb_iftrue,
MUX_uxn_device_h_l127_c13_d1cb_iffalse,
MUX_uxn_device_h_l127_c13_d1cb_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_436e
BIN_OP_OR_uxn_device_h_l127_c5_436e : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_436e_left,
BIN_OP_OR_uxn_device_h_l127_c5_436e_right,
BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_2e81
BIN_OP_EQ_uxn_device_h_l136_c11_2e81 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left,
BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right,
BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_4956
auto_advance_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_4956_cond,
auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_4956
is_auto_x_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output);

-- y_MUX_uxn_device_h_l136_c7_4956
y_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_4956_cond,
y_MUX_uxn_device_h_l136_c7_4956_iftrue,
y_MUX_uxn_device_h_l136_c7_4956_iffalse,
y_MUX_uxn_device_h_l136_c7_4956_return_output);

-- result_MUX_uxn_device_h_l136_c7_4956
result_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_4956_cond,
result_MUX_uxn_device_h_l136_c7_4956_iftrue,
result_MUX_uxn_device_h_l136_c7_4956_iffalse,
result_MUX_uxn_device_h_l136_c7_4956_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_4956
ram_addr_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_4956_cond,
ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_4956
is_auto_y_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output);

-- x_MUX_uxn_device_h_l136_c7_4956
x_MUX_uxn_device_h_l136_c7_4956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_4956_cond,
x_MUX_uxn_device_h_l136_c7_4956_iftrue,
x_MUX_uxn_device_h_l136_c7_4956_iffalse,
x_MUX_uxn_device_h_l136_c7_4956_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_f1fc
CONST_SR_1_uxn_device_h_l139_c15_f1fc : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_f1fc_x,
CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output);

-- y_MUX_uxn_device_h_l140_c3_11a4
y_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_11a4_cond,
y_MUX_uxn_device_h_l140_c3_11a4_iftrue,
y_MUX_uxn_device_h_l140_c3_11a4_iffalse,
y_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4
result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_11a4
result_u8_value_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_11a4
result_u16_addr_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4
result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4
result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- x_MUX_uxn_device_h_l140_c3_11a4
x_MUX_uxn_device_h_l140_c3_11a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_11a4_cond,
x_MUX_uxn_device_h_l140_c3_11a4_iftrue,
x_MUX_uxn_device_h_l140_c3_11a4_iffalse,
x_MUX_uxn_device_h_l140_c3_11a4_return_output);

-- y_MUX_uxn_device_h_l144_c4_4d3c
y_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_4d3c_cond,
y_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
y_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
y_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c
result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c
result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_4d3c
result_u8_value_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- x_MUX_uxn_device_h_l144_c4_4d3c
x_MUX_uxn_device_h_l144_c4_4d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_4d3c_cond,
x_MUX_uxn_device_h_l144_c4_4d3c_iftrue,
x_MUX_uxn_device_h_l144_c4_4d3c_iffalse,
x_MUX_uxn_device_h_l144_c4_4d3c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_d402
BIN_OP_PLUS_uxn_device_h_l145_c5_d402 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_65d8
CONST_SR_8_uxn_device_h_l148_c33_65d8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_65d8_x,
CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output);

-- y_MUX_uxn_device_h_l149_c11_99bf
y_MUX_uxn_device_h_l149_c11_99bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_99bf_cond,
y_MUX_uxn_device_h_l149_c11_99bf_iftrue,
y_MUX_uxn_device_h_l149_c11_99bf_iffalse,
y_MUX_uxn_device_h_l149_c11_99bf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf
result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf
result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_99bf
result_u8_value_MUX_uxn_device_h_l149_c11_99bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_61c7
BIN_OP_PLUS_uxn_device_h_l150_c5_61c7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_b934
CONST_SR_8_uxn_device_h_l153_c33_b934 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_b934_x,
CONST_SR_8_uxn_device_h_l153_c33_b934_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_3f76
BIN_OP_EQ_uxn_device_h_l161_c11_3f76 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left,
BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right,
BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output);

-- y_MUX_uxn_device_h_l161_c7_d643
y_MUX_uxn_device_h_l161_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_d643_cond,
y_MUX_uxn_device_h_l161_c7_d643_iftrue,
y_MUX_uxn_device_h_l161_c7_d643_iffalse,
y_MUX_uxn_device_h_l161_c7_d643_return_output);

-- result_MUX_uxn_device_h_l161_c7_d643
result_MUX_uxn_device_h_l161_c7_d643 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_d643_cond,
result_MUX_uxn_device_h_l161_c7_d643_iftrue,
result_MUX_uxn_device_h_l161_c7_d643_iffalse,
result_MUX_uxn_device_h_l161_c7_d643_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_d643
ram_addr_MUX_uxn_device_h_l161_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_d643_cond,
ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output);

-- y_MUX_uxn_device_h_l162_c3_5b19
y_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_5b19_cond,
y_MUX_uxn_device_h_l162_c3_5b19_iftrue,
y_MUX_uxn_device_h_l162_c3_5b19_iffalse,
y_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19
result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19
result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_5b19
result_u8_value_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_5b19
ram_addr_MUX_uxn_device_h_l162_c3_5b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond,
ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output);

-- y_MUX_uxn_device_h_l163_c4_7aa3
y_MUX_uxn_device_h_l163_c4_7aa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_7aa3_cond,
y_MUX_uxn_device_h_l163_c4_7aa3_iftrue,
y_MUX_uxn_device_h_l163_c4_7aa3_iffalse,
y_MUX_uxn_device_h_l163_c4_7aa3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3
result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3
result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_7aa3
result_u8_value_MUX_uxn_device_h_l163_c4_7aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f
UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_42df
BIN_OP_PLUS_uxn_device_h_l169_c5_42df : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_0494
BIN_OP_EQ_uxn_device_h_l181_c11_0494 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_0494_left,
BIN_OP_EQ_uxn_device_h_l181_c11_0494_right,
BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output);

-- result_MUX_uxn_device_h_l181_c7_e5b5
result_MUX_uxn_device_h_l181_c7_e5b5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_e5b5_cond,
result_MUX_uxn_device_h_l181_c7_e5b5_iftrue,
result_MUX_uxn_device_h_l181_c7_e5b5_iffalse,
result_MUX_uxn_device_h_l181_c7_e5b5_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_e5b5
ram_addr_MUX_uxn_device_h_l181_c7_e5b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond,
ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a
result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_3b4a
result_u8_value_MUX_uxn_device_h_l182_c3_3b4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_3b4a
ram_addr_MUX_uxn_device_h_l182_c3_3b4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond,
ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_0503
CONST_SR_8_uxn_device_h_l186_c32_0503 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_0503_x,
CONST_SR_8_uxn_device_h_l186_c32_0503_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_7880
BIN_OP_OR_uxn_device_h_l189_c4_7880 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_7880_left,
BIN_OP_OR_uxn_device_h_l189_c4_7880_right,
BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_8faf
BIN_OP_EQ_uxn_device_h_l192_c11_8faf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left,
BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right,
BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output);

-- result_MUX_uxn_device_h_l192_c7_7a02
result_MUX_uxn_device_h_l192_c7_7a02 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_7a02_cond,
result_MUX_uxn_device_h_l192_c7_7a02_iftrue,
result_MUX_uxn_device_h_l192_c7_7a02_iffalse,
result_MUX_uxn_device_h_l192_c7_7a02_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15
result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15
result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_7b15
result_u8_value_MUX_uxn_device_h_l193_c3_7b15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output);

-- result_MUX_uxn_device_h_l202_c3_979e
result_MUX_uxn_device_h_l202_c3_979e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_979e_cond,
result_MUX_uxn_device_h_l202_c3_979e_iftrue,
result_MUX_uxn_device_h_l202_c3_979e_iffalse,
result_MUX_uxn_device_h_l202_c3_979e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_36a8
BIN_OP_MINUS_uxn_device_h_l203_c58_36a8 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output);

-- screen_blit_uxn_device_h_l203_c46_592f
screen_blit_uxn_device_h_l203_c46_592f : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_592f_phase,
screen_blit_uxn_device_h_l203_c46_592f_ctrl,
screen_blit_uxn_device_h_l203_c46_592f_auto_advance,
screen_blit_uxn_device_h_l203_c46_592f_x,
screen_blit_uxn_device_h_l203_c46_592f_y,
screen_blit_uxn_device_h_l203_c46_592f_ram_addr,
screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_592f_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 x,
 y,
 ram_addr,
 ctrl,
 auto_advance,
 tmp8,
 color,
 is_pixel_port,
 is_sprite_port,
 is_drawing_port,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_auto_x,
 is_auto_y,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output,
 y_MUX_uxn_device_h_l88_c2_09c5_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output,
 color_MUX_uxn_device_h_l88_c2_09c5_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output,
 result_MUX_uxn_device_h_l88_c2_09c5_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output,
 layer_MUX_uxn_device_h_l88_c2_09c5_return_output,
 x_MUX_uxn_device_h_l88_c2_09c5_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output,
 MUX_uxn_device_h_l89_c19_e4bf_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output,
 MUX_uxn_device_h_l90_c20_0e6f_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output,
 MUX_uxn_device_h_l95_c32_1306_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output,
 y_MUX_uxn_device_h_l101_c7_4e29_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output,
 color_MUX_uxn_device_h_l101_c7_4e29_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output,
 result_MUX_uxn_device_h_l101_c7_4e29_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output,
 layer_MUX_uxn_device_h_l101_c7_4e29_return_output,
 x_MUX_uxn_device_h_l101_c7_4e29_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output,
 y_MUX_uxn_device_h_l104_c7_7b77_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output,
 color_MUX_uxn_device_h_l104_c7_7b77_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output,
 result_MUX_uxn_device_h_l104_c7_7b77_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output,
 layer_MUX_uxn_device_h_l104_c7_7b77_return_output,
 x_MUX_uxn_device_h_l104_c7_7b77_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_2235_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_111e_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_a372_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output,
 y_MUX_uxn_device_h_l113_c7_a372_return_output,
 result_MUX_uxn_device_h_l113_c7_a372_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output,
 x_MUX_uxn_device_h_l113_c7_a372_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output,
 y_MUX_uxn_device_h_l117_c7_ead4_return_output,
 result_MUX_uxn_device_h_l117_c7_ead4_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output,
 x_MUX_uxn_device_h_l117_c7_ead4_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_2621_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output,
 MUX_uxn_device_h_l126_c13_872c_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output,
 MUX_uxn_device_h_l127_c13_d1cb_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output,
 y_MUX_uxn_device_h_l136_c7_4956_return_output,
 result_MUX_uxn_device_h_l136_c7_4956_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output,
 x_MUX_uxn_device_h_l136_c7_4956_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output,
 y_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output,
 x_MUX_uxn_device_h_l140_c3_11a4_return_output,
 y_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 x_MUX_uxn_device_h_l144_c4_4d3c_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output,
 y_MUX_uxn_device_h_l149_c11_99bf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_b934_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output,
 y_MUX_uxn_device_h_l161_c7_d643_return_output,
 result_MUX_uxn_device_h_l161_c7_d643_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output,
 y_MUX_uxn_device_h_l162_c3_5b19_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output,
 y_MUX_uxn_device_h_l163_c4_7aa3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output,
 result_MUX_uxn_device_h_l181_c7_e5b5_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_0503_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output,
 result_MUX_uxn_device_h_l192_c7_7a02_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output,
 result_MUX_uxn_device_h_l202_c3_979e_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output,
 screen_blit_uxn_device_h_l203_c46_592f_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_09c5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_09c5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_09c5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_4e29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_09c5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_09c5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_09c5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_4e29_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_09c5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_09c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_e4bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_e4bf_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_e4bf_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_e4bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e6f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e6f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e6f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_1306_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_1306_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_1306_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_1306_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_4e29_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_4e29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_4e29_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7b77_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_4e29_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_4e29_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7b77_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_7b77_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7b77_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7b77_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_a372_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7b77_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7b77_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_a372_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7b77_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_a1e2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_a936_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_e629_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_5567_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cd5b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_a372_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_a372_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_a372_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_ead4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_a372_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_a372_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_ead4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_a372_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_ead4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0486_uxn_device_h_l117_c7_ead4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_ead4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_4956_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_ead4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_ead4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_4956_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_ead4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_596b : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_7b89 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_72ee : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_872c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_872c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_872c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_872c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d1cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d1cb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d1cb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d1cb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_6890 : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_9390 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_4956_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d252_uxn_device_h_l136_c7_4956_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_4956_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_d643_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_4292 : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_4956_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_4956_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_4956_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_x : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_18a7 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_11a4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4d3c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_11a4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_11a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_de3f : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_d450 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4d3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4886_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_3175 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_0ede_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_d643_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l161_c7_d643_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_d643_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e5b5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_89b8 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_84f7_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_f85b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l181_c7_e5b5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_7a02_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_8a44_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_7a02_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l192_c7_7a02_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_7a02_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_979e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_7a02_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b907_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_979e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_979e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_979e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_979e_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_9206 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e4fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_d222_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_0e0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_fa2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_bd79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_b058_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_2a9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_is_pixel_port : unsigned(0 downto 0);
variable REG_VAR_is_sprite_port : unsigned(0 downto 0);
variable REG_VAR_is_drawing_port : unsigned(0 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_auto_x : unsigned(0 downto 0);
variable REG_VAR_is_auto_y : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ram_addr := ram_addr;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_color := color;
  REG_VAR_is_pixel_port := is_pixel_port;
  REG_VAR_is_sprite_port := is_sprite_port;
  REG_VAR_is_drawing_port := is_drawing_port;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_auto_x := is_auto_x;
  REG_VAR_is_auto_y := is_auto_y;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_e4bf_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_e4bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right := to_unsigned(14, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l126_c13_872c_iffalse := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right := to_unsigned(5, 8);
     VAR_MUX_uxn_device_h_l95_c32_1306_iffalse := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right := to_unsigned(6, 8);
     VAR_MUX_uxn_device_h_l127_c13_d1cb_iftrue := to_unsigned(4, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse := to_unsigned(43, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse := to_unsigned(45, 8);
     VAR_MUX_uxn_device_h_l90_c20_0e6f_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_9206 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_7b89 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_7b89;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right := to_unsigned(3, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue := to_unsigned(41, 8);
     VAR_result_u8_value_uxn_device_h_l143_c4_de3f := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_de3f;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right := to_unsigned(8, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l127_c13_d1cb_iffalse := to_unsigned(0, 8);
     VAR_result_u16_addr_uxn_device_h_l142_c4_18a7 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_18a7;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_right := to_unsigned(7, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right := to_unsigned(3, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue := to_unsigned(42, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l126_c13_872c_iftrue := to_unsigned(24, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l90_c20_0e6f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_1306_iftrue := to_unsigned(46, 8);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_4e29_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_7b77_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_09c5_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_872c_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_d1cb_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_7aa3_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_11a4_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_5b19_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_979e_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_6890 := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_979e_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_4e29_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_7b77_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_ead4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_4956_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_11a4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_09c5_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_4e29_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_7b77_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_a372_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_11a4_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_99bf_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_d643_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_5b19_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_09c5_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_x := VAR_auto_advance_uxn_device_h_l137_c3_6890;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_6890;
     VAR_is_auto_x_uxn_device_h_l138_c3_9390 := resize(VAR_auto_advance_uxn_device_h_l137_c3_6890, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_x_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     VAR_y_MUX_uxn_device_h_l144_c4_4d3c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_9390;
     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_2660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_2660_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_2660_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_c21d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_4e29] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_4e29_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_a372] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_a372_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_2fc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;

     -- CONST_SR_6[uxn_device_h_l108_c21_aa52] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_aa52_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output := CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output := result.device_ram_address;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_36a8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_111e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_111e_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_return_output := CONST_SR_4_uxn_device_h_l110_c22_111e_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output := result.u8_value;

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_7a4f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_7b77] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7b77_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l161_c11_3f76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_0494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_0494_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_0494_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_7c8b] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_7c8b_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output := CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_2a9c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_2a9c_return_output := result.u16_addr;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_84f7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_84f7_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_61c7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_7aa3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_b099] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_b099_return_output := result.vram_write_layer;

     -- MUX[uxn_device_h_l127_c13_d1cb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_d1cb_cond <= VAR_MUX_uxn_device_h_l127_c13_d1cb_cond;
     MUX_uxn_device_h_l127_c13_d1cb_iftrue <= VAR_MUX_uxn_device_h_l127_c13_d1cb_iftrue;
     MUX_uxn_device_h_l127_c13_d1cb_iffalse <= VAR_MUX_uxn_device_h_l127_c13_d1cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_d1cb_return_output := MUX_uxn_device_h_l127_c13_d1cb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_8f33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_78c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_a1e2] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_a1e2_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_0a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;

     -- CONST_SR_8[uxn_device_h_l186_c32_0503] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_0503_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_return_output := CONST_SR_8_uxn_device_h_l186_c32_0503_return_output;

     -- MUX[uxn_device_h_l126_c13_872c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_872c_cond <= VAR_MUX_uxn_device_h_l126_c13_872c_cond;
     MUX_uxn_device_h_l126_c13_872c_iftrue <= VAR_MUX_uxn_device_h_l126_c13_872c_iftrue;
     MUX_uxn_device_h_l126_c13_872c_iffalse <= VAR_MUX_uxn_device_h_l126_c13_872c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_872c_return_output := MUX_uxn_device_h_l126_c13_872c_return_output;

     -- CONST_SR_7[uxn_device_h_l107_c25_2235] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_2235_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_return_output := CONST_SR_7_uxn_device_h_l107_c25_2235_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_2e81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_b058 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_b058_return_output := result.is_vram_write;

     -- CONST_SR_1[uxn_device_h_l139_c15_f1fc] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_f1fc_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output := CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_8faf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_5c81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_7aa3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output;

     -- BIN_OP_AND[uxn_device_h_l121_c11_bfc9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_left;
     BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output := BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_b907] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b907_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_d402] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_42df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_72ee := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_bfc9_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_2660_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_7b77_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_78c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_a372_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2fc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_ead4_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_c21d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_4956_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_2e81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_d643_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_d643_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_3f76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_e5b5_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0494_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_7a02_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8faf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_09c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_0a6d_return_output;
     VAR_MUX_uxn_device_h_l89_c19_e4bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_8f33_return_output;
     VAR_MUX_uxn_device_h_l90_c20_0e6f_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_5c81_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_592f_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_36a8_return_output;
     VAR_x_uxn_device_h_l145_c5_d450 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_d402_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_3175 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_61c7_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_89b8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_42df_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_a372_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_ead4_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l177_l118_l189_DUPLICATE_d961_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_a1e2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_84f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b907_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_2a9c_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_2a9c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_b4c2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_0a95_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_b058_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_b058_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_a093_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_4f04_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_4292 := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_f1fc_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_right := VAR_MUX_uxn_device_h_l126_c13_872c_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_right := VAR_MUX_uxn_device_h_l127_c13_d1cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_7a4f_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_4e29_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_4e29_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7b77_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_a372_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_a372_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_7aa3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_7aa3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_b099_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_y_MUX_uxn_device_h_l149_c11_99bf_cond := VAR_is_auto_y_uxn_device_h_l139_c3_4292;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_left := VAR_tmp8_uxn_device_h_l121_c4_72ee;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse := VAR_tmp8_uxn_device_h_l121_c4_72ee;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_x := VAR_x_uxn_device_h_l145_c5_d450;
     VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iftrue := VAR_x_uxn_device_h_l145_c5_d450;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_x := VAR_y_uxn_device_h_l150_c5_3175;
     VAR_y_MUX_uxn_device_h_l149_c11_99bf_iftrue := VAR_y_uxn_device_h_l150_c5_3175;
     VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iffalse := VAR_y_uxn_device_h_l169_c5_89b8;
     -- y_MUX[uxn_device_h_l149_c11_99bf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_99bf_cond <= VAR_y_MUX_uxn_device_h_l149_c11_99bf_cond;
     y_MUX_uxn_device_h_l149_c11_99bf_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_99bf_iftrue;
     y_MUX_uxn_device_h_l149_c11_99bf_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_99bf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_99bf_return_output := y_MUX_uxn_device_h_l149_c11_99bf_return_output;

     -- MUX[uxn_device_h_l90_c20_0e6f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_0e6f_cond <= VAR_MUX_uxn_device_h_l90_c20_0e6f_cond;
     MUX_uxn_device_h_l90_c20_0e6f_iftrue <= VAR_MUX_uxn_device_h_l90_c20_0e6f_iftrue;
     MUX_uxn_device_h_l90_c20_0e6f_iffalse <= VAR_MUX_uxn_device_h_l90_c20_0e6f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_0e6f_return_output := MUX_uxn_device_h_l90_c20_0e6f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_99bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_7880] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_7880_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_left;
     BIN_OP_OR_uxn_device_h_l189_c4_7880_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output := BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output;

     -- x_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_x_MUX_uxn_device_h_l144_c4_4d3c_cond;
     x_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     x_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_4d3c_return_output := x_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- CONST_SR_8[uxn_device_h_l148_c33_65d8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_65d8_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output := CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output;

     -- CONST_SR_8[uxn_device_h_l153_c33_b934] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_b934_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_return_output := CONST_SR_8_uxn_device_h_l153_c33_b934_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_7b15] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_cond;
     ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output := ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_a936] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_a936_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_2235_return_output);

     -- result_u8_value_MUX[uxn_device_h_l193_c3_7b15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_cd5b] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cd5b_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_111e_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_5567] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_5567_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_7c8b_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_99bf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_f85b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_f85b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_89b8);

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_8a44] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_8a44_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_0503_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_7b15] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_e629] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_e629_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_aa52_return_output);

     -- BIN_OP_OR[uxn_device_h_l126_c5_8612] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_8612_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_left;
     BIN_OP_OR_uxn_device_h_l126_c5_8612_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output := BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_99bf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_2621] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_3b4a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_7b15] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output;

     -- MUX[uxn_device_h_l89_c19_e4bf] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_e4bf_cond <= VAR_MUX_uxn_device_h_l89_c19_e4bf_cond;
     MUX_uxn_device_h_l89_c19_e4bf_iftrue <= VAR_MUX_uxn_device_h_l89_c19_e4bf_iftrue;
     MUX_uxn_device_h_l89_c19_e4bf_iffalse <= VAR_MUX_uxn_device_h_l89_c19_e4bf_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_e4bf_return_output := MUX_uxn_device_h_l89_c19_e4bf_return_output;

     -- color_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_color_MUX_uxn_device_h_l104_c7_7b77_cond;
     color_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     color_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_7b77_return_output := color_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_7aa3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output := auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- y_MUX[uxn_device_h_l163_c4_7aa3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_7aa3_cond <= VAR_y_MUX_uxn_device_h_l163_c4_7aa3_cond;
     y_MUX_uxn_device_h_l163_c4_7aa3_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iftrue;
     y_MUX_uxn_device_h_l163_c4_7aa3_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_7aa3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_7aa3_return_output := y_MUX_uxn_device_h_l163_c4_7aa3_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_3b4a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_8612_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_7880_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_a936_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_e629_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_5567_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cd5b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_f85b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_8a44_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_7f01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_left := VAR_MUX_uxn_device_h_l89_c19_e4bf_return_output;
     VAR_MUX_uxn_device_h_l95_c32_1306_cond := VAR_MUX_uxn_device_h_l89_c19_e4bf_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue := VAR_MUX_uxn_device_h_l89_c19_e4bf_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_right := VAR_MUX_uxn_device_h_l90_c20_0e6f_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue := VAR_MUX_uxn_device_h_l90_c20_0e6f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_99bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_2621_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_99bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_7aa3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_99bf_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_99bf_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_5b19_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_7aa3_return_output;
     -- ram_addr_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output := ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_4886] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4886_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_65d8_return_output);

     -- result_u8_value_MUX[uxn_device_h_l163_c4_7aa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output;

     -- is_auto_x_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_7bd8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_0ede] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_0ede_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_b934_return_output);

     -- is_auto_y_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l182_c3_3b4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output;

     -- x_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_x_MUX_uxn_device_h_l140_c3_11a4_cond;
     x_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     x_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_11a4_return_output := x_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9[uxn_device_h_l192_c7_7a02] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l192_c7_7a02_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_7b15_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_7b15_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_7b15_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_7b15_return_output);

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_cond;
     flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output := flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_cond;
     flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output := flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- y_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_y_MUX_uxn_device_h_l144_c4_4d3c_cond;
     y_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     y_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_4d3c_return_output := y_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- y_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_y_MUX_uxn_device_h_l162_c3_5b19_cond;
     y_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     y_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_5b19_return_output := y_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_cond;
     ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output := ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_7b77_cond;
     layer_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     layer_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_7b77_return_output := layer_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- color_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_color_MUX_uxn_device_h_l101_c7_4e29_cond;
     color_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     color_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_4e29_return_output := color_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_6975] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_6975_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_left;
     BIN_OP_OR_uxn_device_h_l91_c21_6975_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output := BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- MUX[uxn_device_h_l95_c32_1306] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_1306_cond <= VAR_MUX_uxn_device_h_l95_c32_1306_cond;
     MUX_uxn_device_h_l95_c32_1306_iftrue <= VAR_MUX_uxn_device_h_l95_c32_1306_iftrue;
     MUX_uxn_device_h_l95_c32_1306_iffalse <= VAR_MUX_uxn_device_h_l95_c32_1306_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_1306_return_output := MUX_uxn_device_h_l95_c32_1306_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_3b4a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output := ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output := auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- BIN_OP_OR[uxn_device_h_l127_c5_436e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_436e_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_left;
     BIN_OP_OR_uxn_device_h_l127_c5_436e_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output := BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_436e_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_6975_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_596b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7bd8_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4886_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_0ede_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue := VAR_MUX_uxn_device_h_l95_c32_1306_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_ead4_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_5b19_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_3b4a_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_7a02_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l192_c7_7a02_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_7aa3_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_11a4_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_d643_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_5b19_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_596b;
     -- ram_addr_MUX[uxn_device_h_l181_c7_e5b5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output := ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_cond;
     flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output := flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_2621] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_2621_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_cond;
     tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_return_output := tmp8_MUX_uxn_device_h_l125_c4_2621_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_31e5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output := auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_cond;
     flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output := flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_u8_value_MUX[uxn_device_h_l162_c3_5b19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_31e5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output;

     -- y_MUX[uxn_device_h_l161_c7_d643] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_d643_cond <= VAR_y_MUX_uxn_device_h_l161_c7_d643_cond;
     y_MUX_uxn_device_h_l161_c7_d643_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_d643_iftrue;
     y_MUX_uxn_device_h_l161_c7_d643_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_d643_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_d643_return_output := y_MUX_uxn_device_h_l161_c7_d643_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l181_c7_e5b5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l181_c7_e5b5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_3b4a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_3b4a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_3b4a_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_4e29_cond;
     layer_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     layer_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_4e29_return_output := layer_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- y_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_y_MUX_uxn_device_h_l140_c3_11a4_cond;
     y_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     y_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_11a4_return_output := y_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_99bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_cond;
     ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output := ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- color_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_color_MUX_uxn_device_h_l88_c2_09c5_cond;
     color_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     color_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_09c5_return_output := color_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- x_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_x_MUX_uxn_device_h_l136_c7_4956_cond;
     x_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_4956_iftrue;
     x_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_4956_return_output := x_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_a372_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_a372_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_a372_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_a372_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_e5b5_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l181_c7_e5b5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_99bf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_2621_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_11a4_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_4956_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_d643_return_output;
     -- is_auto_x_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_cond;
     flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output := flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_4d3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9[uxn_device_h_l161_c7_d643] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l161_c7_d643_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_5b19_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_5b19_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_5b19_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_5b19_return_output);

     -- x_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_x_MUX_uxn_device_h_l117_c7_ead4_cond;
     x_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     x_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_ead4_return_output := x_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_cond;
     tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_return_output := tmp8_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_b099] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output;

     -- y_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_y_MUX_uxn_device_h_l136_c7_4956_cond;
     y_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_4956_iftrue;
     y_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_4956_return_output := y_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output := auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_cond;
     flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output := flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_09c5_cond;
     layer_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     layer_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_09c5_return_output := layer_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l88_c2_09c5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_09c5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_31e5_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_31e5_return_output);

     -- ram_addr_MUX[uxn_device_h_l161_c7_d643] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_d643_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output := ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_7b77_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7b77_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_d643_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_09c5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_09c5_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_d643_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a5f9_uxn_device_h_l161_c7_d643_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4d3c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_b099_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_4956_return_output;
     -- is_auto_x_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_cond;
     tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output := tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output := ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- x_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_x_MUX_uxn_device_h_l113_c7_a372_cond;
     x_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_a372_iftrue;
     x_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_a372_return_output := x_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- result_u8_value_MUX[uxn_device_h_l140_c3_11a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output;

     -- y_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_y_MUX_uxn_device_h_l117_c7_ead4_cond;
     y_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     y_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_ead4_return_output := y_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output := auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0486[uxn_device_h_l117_c7_ead4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0486_uxn_device_h_l117_c7_ead4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_0486(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_b099_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_b099_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_b099_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_b099_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_b099_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_b099_return_output);

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_4956_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_ead4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0486_uxn_device_h_l117_c7_ead4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_a372_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_ead4_return_output;
     -- x_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_x_MUX_uxn_device_h_l104_c7_7b77_cond;
     x_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     x_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_7b77_return_output := x_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_cond;
     tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_return_output := tmp8_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output := auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output := ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- y_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_y_MUX_uxn_device_h_l113_c7_a372_cond;
     y_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_a372_iftrue;
     y_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_a372_return_output := y_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d252[uxn_device_h_l136_c7_4956] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d252_uxn_device_h_l136_c7_4956_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d252(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_11a4_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_11a4_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_11a4_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_11a4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_11a4_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_11a4_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_d643] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_d643_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_ead4_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_4956_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d252_uxn_device_h_l136_c7_4956_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_a372_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_a372_return_output;
     -- x_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_x_MUX_uxn_device_h_l101_c7_4e29_cond;
     x_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     x_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_4e29_return_output := x_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_cond;
     tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output := tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- y_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_y_MUX_uxn_device_h_l104_c7_7b77_cond;
     y_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     y_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_7b77_return_output := y_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output := ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_e5b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_e5b5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_a372_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_4e29_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_7b77_return_output;
     -- y_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_y_MUX_uxn_device_h_l101_c7_4e29_cond;
     y_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     y_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_4e29_return_output := y_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- tmp8_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_cond;
     tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output := tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output := ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- x_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_x_MUX_uxn_device_h_l88_c2_09c5_cond;
     x_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     x_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_09c5_return_output := x_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_7a02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_7a02_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_7b77_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_4e29_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_4e29_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_b289] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_cond;
     tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output := tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- y_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_y_MUX_uxn_device_h_l88_c2_09c5_cond;
     y_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     y_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_09c5_return_output := y_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output := ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_b289_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_4e29_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_09c5_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_09c5_return_output;
     -- ram_addr_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output := ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_cddd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_cddd_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_09c5_return_output;
     -- screen_blit[uxn_device_h_l203_c46_592f] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_592f_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_592f_phase <= VAR_screen_blit_uxn_device_h_l203_c46_592f_phase;
     screen_blit_uxn_device_h_l203_c46_592f_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_592f_ctrl;
     screen_blit_uxn_device_h_l203_c46_592f_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_592f_auto_advance;
     screen_blit_uxn_device_h_l203_c46_592f_x <= VAR_screen_blit_uxn_device_h_l203_c46_592f_x;
     screen_blit_uxn_device_h_l203_c46_592f_y <= VAR_screen_blit_uxn_device_h_l203_c46_592f_y;
     screen_blit_uxn_device_h_l203_c46_592f_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_592f_ram_addr;
     screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_592f_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output := screen_blit_uxn_device_h_l203_c46_592f_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_d222] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_d222_return_output := VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_bd79] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_bd79_return_output := VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output.is_blit_done;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_e4fc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e4fc_return_output := VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_fa2e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_fa2e_return_output := VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_0e0c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_0e0c_return_output := VAR_screen_blit_uxn_device_h_l203_c46_592f_return_output.vram_write_layer;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_979e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_979e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_9206,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e4fc_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_d222_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_0e0c_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_fa2e_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_bd79_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_979e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_979e_return_output;
     -- result_MUX[uxn_device_h_l202_c3_979e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_979e_cond <= VAR_result_MUX_uxn_device_h_l202_c3_979e_cond;
     result_MUX_uxn_device_h_l202_c3_979e_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_979e_iftrue;
     result_MUX_uxn_device_h_l202_c3_979e_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_979e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_979e_return_output := result_MUX_uxn_device_h_l202_c3_979e_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_7a02_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_979e_return_output;
     -- result_MUX[uxn_device_h_l192_c7_7a02] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_7a02_cond <= VAR_result_MUX_uxn_device_h_l192_c7_7a02_cond;
     result_MUX_uxn_device_h_l192_c7_7a02_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_7a02_iftrue;
     result_MUX_uxn_device_h_l192_c7_7a02_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_7a02_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_7a02_return_output := result_MUX_uxn_device_h_l192_c7_7a02_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_7a02_return_output;
     -- result_MUX[uxn_device_h_l181_c7_e5b5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_e5b5_cond <= VAR_result_MUX_uxn_device_h_l181_c7_e5b5_cond;
     result_MUX_uxn_device_h_l181_c7_e5b5_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iftrue;
     result_MUX_uxn_device_h_l181_c7_e5b5_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_e5b5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_e5b5_return_output := result_MUX_uxn_device_h_l181_c7_e5b5_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_d643_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_e5b5_return_output;
     -- result_MUX[uxn_device_h_l161_c7_d643] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_d643_cond <= VAR_result_MUX_uxn_device_h_l161_c7_d643_cond;
     result_MUX_uxn_device_h_l161_c7_d643_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_d643_iftrue;
     result_MUX_uxn_device_h_l161_c7_d643_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_d643_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_d643_return_output := result_MUX_uxn_device_h_l161_c7_d643_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_4956_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_d643_return_output;
     -- result_MUX[uxn_device_h_l136_c7_4956] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_4956_cond <= VAR_result_MUX_uxn_device_h_l136_c7_4956_cond;
     result_MUX_uxn_device_h_l136_c7_4956_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_4956_iftrue;
     result_MUX_uxn_device_h_l136_c7_4956_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_4956_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_4956_return_output := result_MUX_uxn_device_h_l136_c7_4956_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_ead4_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_4956_return_output;
     -- result_MUX[uxn_device_h_l117_c7_ead4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_ead4_cond <= VAR_result_MUX_uxn_device_h_l117_c7_ead4_cond;
     result_MUX_uxn_device_h_l117_c7_ead4_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_ead4_iftrue;
     result_MUX_uxn_device_h_l117_c7_ead4_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_ead4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_ead4_return_output := result_MUX_uxn_device_h_l117_c7_ead4_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_a372_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_ead4_return_output;
     -- result_MUX[uxn_device_h_l113_c7_a372] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_a372_cond <= VAR_result_MUX_uxn_device_h_l113_c7_a372_cond;
     result_MUX_uxn_device_h_l113_c7_a372_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_a372_iftrue;
     result_MUX_uxn_device_h_l113_c7_a372_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_a372_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_a372_return_output := result_MUX_uxn_device_h_l113_c7_a372_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_7b77_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_a372_return_output;
     -- result_MUX[uxn_device_h_l104_c7_7b77] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_7b77_cond <= VAR_result_MUX_uxn_device_h_l104_c7_7b77_cond;
     result_MUX_uxn_device_h_l104_c7_7b77_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_7b77_iftrue;
     result_MUX_uxn_device_h_l104_c7_7b77_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_7b77_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_7b77_return_output := result_MUX_uxn_device_h_l104_c7_7b77_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_4e29_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_7b77_return_output;
     -- result_MUX[uxn_device_h_l101_c7_4e29] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_4e29_cond <= VAR_result_MUX_uxn_device_h_l101_c7_4e29_cond;
     result_MUX_uxn_device_h_l101_c7_4e29_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_4e29_iftrue;
     result_MUX_uxn_device_h_l101_c7_4e29_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_4e29_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_4e29_return_output := result_MUX_uxn_device_h_l101_c7_4e29_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_09c5_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_4e29_return_output;
     -- result_MUX[uxn_device_h_l88_c2_09c5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_09c5_cond <= VAR_result_MUX_uxn_device_h_l88_c2_09c5_cond;
     result_MUX_uxn_device_h_l88_c2_09c5_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_09c5_iftrue;
     result_MUX_uxn_device_h_l88_c2_09c5_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_09c5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_09c5_return_output := result_MUX_uxn_device_h_l88_c2_09c5_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_09c5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_09c5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_pixel_port <= REG_VAR_is_pixel_port;
REG_COMB_is_sprite_port <= REG_VAR_is_sprite_port;
REG_COMB_is_drawing_port <= REG_VAR_is_drawing_port;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_auto_x <= REG_VAR_is_auto_x;
REG_COMB_is_auto_y <= REG_VAR_is_auto_y;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ram_addr <= REG_COMB_ram_addr;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     tmp8 <= REG_COMB_tmp8;
     color <= REG_COMB_color;
     is_pixel_port <= REG_COMB_is_pixel_port;
     is_sprite_port <= REG_COMB_is_sprite_port;
     is_drawing_port <= REG_COMB_is_drawing_port;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_auto_x <= REG_COMB_is_auto_x;
     is_auto_y <= REG_COMB_is_auto_y;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
