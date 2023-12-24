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
-- BIN_OP_EQ[uxn_device_h_l88_c6_17b3]
signal BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_dccb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_bbd5]
signal ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_bbd5]
signal auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l88_c2_bbd5]
signal result_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_bbd5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_bbd5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_bbd5_return_output : device_out_result_t;

-- layer_MUX[uxn_device_h_l88_c2_bbd5]
signal layer_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_bbd5]
signal tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_bbd5]
signal ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_bbd5]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_bbd5]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_bbd5]
signal y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_bbd5]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_bbd5]
signal flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_bbd5]
signal x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_bbd5]
signal is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_bbd5]
signal flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_bbd5]
signal is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_bbd5]
signal color_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(3 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_bbd5]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_4c54]
signal BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_10e0]
signal MUX_uxn_device_h_l89_c19_10e0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_10e0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_10e0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_10e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_26d5]
signal BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_9310]
signal MUX_uxn_device_h_l90_c20_9310_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_9310_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_9310_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_9310_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_5f44]
signal BIN_OP_OR_uxn_device_h_l91_c21_5f44_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_5f44_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_8b4b]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_8b4b]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c32_0e17]
signal MUX_uxn_device_h_l95_c32_0e17_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_0e17_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_0e17_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_0e17_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_383b]
signal BIN_OP_EQ_uxn_device_h_l101_c11_383b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_383b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_266a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_dccb]
signal ctrl_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_dccb]
signal auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l101_c7_dccb]
signal result_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_dccb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_dccb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_dccb_return_output : device_out_result_t;

-- layer_MUX[uxn_device_h_l101_c7_dccb]
signal layer_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_dccb]
signal tmp8_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_dccb]
signal ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_dccb]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_dccb]
signal y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_dccb]
signal flip_x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l101_c7_dccb]
signal x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_dccb]
signal is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_dccb]
signal flip_y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_dccb]
signal is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l101_c7_dccb]
signal color_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_c9a1]
signal BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_8bac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_266a]
signal ctrl_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_266a]
signal auto_advance_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l104_c7_266a]
signal result_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_266a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_266a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_266a_return_output : device_out_result_t;

-- layer_MUX[uxn_device_h_l104_c7_266a]
signal layer_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_266a]
signal tmp8_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_266a]
signal ram_addr_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_266a]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l104_c7_266a]
signal y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_266a]
signal flip_x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l104_c7_266a]
signal x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_266a]
signal is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_266a]
signal flip_y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_266a]
signal is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l104_c7_266a]
signal color_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_06b7]
signal CONST_SR_7_uxn_device_h_l107_c25_06b7_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_1c91]
signal CONST_SR_6_uxn_device_h_l108_c21_1c91_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_f9e4]
signal CONST_SR_5_uxn_device_h_l109_c22_f9e4_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_bc97]
signal CONST_SR_4_uxn_device_h_l110_c22_bc97_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_2aec]
signal BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_e64b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_8bac]
signal auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l113_c7_8bac]
signal result_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_8bac_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_8bac_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_8bac_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l113_c7_8bac]
signal tmp8_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_8bac]
signal ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l113_c7_8bac]
signal y_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l113_c7_8bac]
signal x_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_8bac]
signal is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_8bac]
signal is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_7b1b]
signal BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_5ac3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_e64b]
signal auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l117_c7_e64b]
signal result_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_e64b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_e64b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_e64b_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l117_c7_e64b]
signal tmp8_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_e64b]
signal ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l117_c7_e64b]
signal y_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l117_c7_e64b]
signal x_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_e64b]
signal is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l117_c7_e64b]
signal is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_eb43]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_eb43]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_eb43]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_eb43]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_eb43]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_eb43]
signal result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l119_c3_eb43]
signal tmp8_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_c151]
signal BIN_OP_AND_uxn_device_h_l121_c11_c151_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_c151_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_839b]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output : unsigned(16 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_8eb4]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_8eb4]
signal tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l126_c13_4d96]
signal MUX_uxn_device_h_l126_c13_4d96_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_4d96_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_4d96_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_4d96_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_4304]
signal BIN_OP_OR_uxn_device_h_l126_c5_4304_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_4304_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_5fae]
signal MUX_uxn_device_h_l127_c13_5fae_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_5fae_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_5fae_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_5fae_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_06da]
signal BIN_OP_OR_uxn_device_h_l127_c5_06da_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_06da_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_b6c3]
signal BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_0503]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_5ac3]
signal auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l136_c7_5ac3]
signal result_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_5ac3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_5ac3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_5ac3_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l136_c7_5ac3]
signal ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l136_c7_5ac3]
signal y_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l136_c7_5ac3]
signal x_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l136_c7_5ac3]
signal is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l136_c7_5ac3]
signal is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l139_c15_c68a]
signal CONST_SR_1_uxn_device_h_l139_c15_c68a_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_f491]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_f491]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_f491]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_f491]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_f491]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_f491]
signal result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l140_c3_f491]
signal y_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l140_c3_f491]
signal x_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_52d7]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_52d7]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_52d7]
signal result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_52d7]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l144_c4_52d7]
signal y_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l144_c4_52d7]
signal x_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_7d1a]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_392b]
signal CONST_SR_8_uxn_device_h_l148_c33_392b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_392b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_787b]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_787b]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_787b]
signal result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_787b]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l149_c11_787b]
signal y_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_9796]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_72ea]
signal CONST_SR_8_uxn_device_h_l153_c33_72ea_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_ccce]
signal BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_1d8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l161_c7_0503]
signal result_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_0503_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_0503_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_0503_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l161_c7_0503]
signal ram_addr_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l161_c7_0503]
signal y_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_c3d3]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_c3d3]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_c3d3]
signal result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_c3d3]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l162_c3_c3d3]
signal ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l162_c3_c3d3]
signal y_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_f675]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_f675]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_f675]
signal result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_f675]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l163_c4_f675]
signal y_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_d450]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_0207]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_f28d]
signal BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_c53e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_1d8a]
signal result_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_1d8a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_1d8a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_1d8a_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l181_c7_1d8a]
signal ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_f6d9]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_f6d9]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_f6d9]
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l182_c3_f6d9]
signal ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_8e37]
signal CONST_SR_8_uxn_device_h_l186_c32_8e37_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_2830]
signal BIN_OP_OR_uxn_device_h_l189_c4_2830_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_2830_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_52f3]
signal BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_c7b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_c53e]
signal result_MUX_uxn_device_h_l192_c7_c53e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_c53e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_c53e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_c53e_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_e1da]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_e1da]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_e1da]
signal result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_e1da]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_4bca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_27f4]
signal result_MUX_uxn_device_h_l202_c3_27f4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_27f4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_27f4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_27f4_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_344d]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_5cd9]
signal screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_5cd9_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_f540( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.u16_addr := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u8_value := ref_toks_6;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.u16_addr := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_ec79( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
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
-- BIN_OP_EQ_uxn_device_h_l88_c6_17b3
BIN_OP_EQ_uxn_device_h_l88_c6_17b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left,
BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right,
BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_bbd5
ctrl_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond,
ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_bbd5
auto_advance_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond,
auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- result_MUX_uxn_device_h_l88_c2_bbd5
result_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_bbd5_cond,
result_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
result_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
result_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- layer_MUX_uxn_device_h_l88_c2_bbd5
layer_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_bbd5_cond,
layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
layer_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_bbd5
tmp8_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond,
tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_bbd5
ram_addr_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond,
ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5
ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5
is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- y_MUX_uxn_device_h_l88_c2_bbd5
y_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_bbd5_cond,
y_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
y_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
y_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5
is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_bbd5
flip_x_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond,
flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- x_MUX_uxn_device_h_l88_c2_bbd5
x_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_bbd5_cond,
x_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
x_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
x_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_bbd5
is_auto_y_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_bbd5
flip_y_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond,
flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_bbd5
is_auto_x_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- color_MUX_uxn_device_h_l88_c2_bbd5
color_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_bbd5_cond,
color_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
color_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
color_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5
is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_4c54
BIN_OP_EQ_uxn_device_h_l89_c19_4c54 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left,
BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right,
BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output);

-- MUX_uxn_device_h_l89_c19_10e0
MUX_uxn_device_h_l89_c19_10e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_10e0_cond,
MUX_uxn_device_h_l89_c19_10e0_iftrue,
MUX_uxn_device_h_l89_c19_10e0_iffalse,
MUX_uxn_device_h_l89_c19_10e0_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_26d5
BIN_OP_EQ_uxn_device_h_l90_c20_26d5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left,
BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right,
BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output);

-- MUX_uxn_device_h_l90_c20_9310
MUX_uxn_device_h_l90_c20_9310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_9310_cond,
MUX_uxn_device_h_l90_c20_9310_iftrue,
MUX_uxn_device_h_l90_c20_9310_iffalse,
MUX_uxn_device_h_l90_c20_9310_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_5f44
BIN_OP_OR_uxn_device_h_l91_c21_5f44 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_5f44_left,
BIN_OP_OR_uxn_device_h_l91_c21_5f44_right,
BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b
result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b
result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output);

-- MUX_uxn_device_h_l95_c32_0e17
MUX_uxn_device_h_l95_c32_0e17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_0e17_cond,
MUX_uxn_device_h_l95_c32_0e17_iftrue,
MUX_uxn_device_h_l95_c32_0e17_iffalse,
MUX_uxn_device_h_l95_c32_0e17_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_383b
BIN_OP_EQ_uxn_device_h_l101_c11_383b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_383b_left,
BIN_OP_EQ_uxn_device_h_l101_c11_383b_right,
BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_dccb
ctrl_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_dccb_cond,
ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_dccb
auto_advance_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond,
auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- result_MUX_uxn_device_h_l101_c7_dccb
result_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_dccb_cond,
result_MUX_uxn_device_h_l101_c7_dccb_iftrue,
result_MUX_uxn_device_h_l101_c7_dccb_iffalse,
result_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- layer_MUX_uxn_device_h_l101_c7_dccb
layer_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_dccb_cond,
layer_MUX_uxn_device_h_l101_c7_dccb_iftrue,
layer_MUX_uxn_device_h_l101_c7_dccb_iffalse,
layer_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_dccb
tmp8_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_dccb_cond,
tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_dccb
ram_addr_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond,
ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_dccb
ctrl_mode_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- y_MUX_uxn_device_h_l101_c7_dccb
y_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_dccb_cond,
y_MUX_uxn_device_h_l101_c7_dccb_iftrue,
y_MUX_uxn_device_h_l101_c7_dccb_iffalse,
y_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_dccb
flip_x_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_dccb_cond,
flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- x_MUX_uxn_device_h_l101_c7_dccb
x_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_dccb_cond,
x_MUX_uxn_device_h_l101_c7_dccb_iftrue,
x_MUX_uxn_device_h_l101_c7_dccb_iffalse,
x_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_dccb
is_auto_y_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_dccb
flip_y_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_dccb_cond,
flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_dccb
is_auto_x_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- color_MUX_uxn_device_h_l101_c7_dccb
color_MUX_uxn_device_h_l101_c7_dccb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_dccb_cond,
color_MUX_uxn_device_h_l101_c7_dccb_iftrue,
color_MUX_uxn_device_h_l101_c7_dccb_iffalse,
color_MUX_uxn_device_h_l101_c7_dccb_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_c9a1
BIN_OP_EQ_uxn_device_h_l104_c11_c9a1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left,
BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right,
BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_266a
ctrl_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_266a_cond,
ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_266a_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_266a
auto_advance_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_266a_cond,
auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output);

-- result_MUX_uxn_device_h_l104_c7_266a
result_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_266a_cond,
result_MUX_uxn_device_h_l104_c7_266a_iftrue,
result_MUX_uxn_device_h_l104_c7_266a_iffalse,
result_MUX_uxn_device_h_l104_c7_266a_return_output);

-- layer_MUX_uxn_device_h_l104_c7_266a
layer_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_266a_cond,
layer_MUX_uxn_device_h_l104_c7_266a_iftrue,
layer_MUX_uxn_device_h_l104_c7_266a_iffalse,
layer_MUX_uxn_device_h_l104_c7_266a_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_266a
tmp8_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_266a_cond,
tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_266a_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_266a
ram_addr_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_266a_cond,
ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_266a
ctrl_mode_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output);

-- y_MUX_uxn_device_h_l104_c7_266a
y_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_266a_cond,
y_MUX_uxn_device_h_l104_c7_266a_iftrue,
y_MUX_uxn_device_h_l104_c7_266a_iffalse,
y_MUX_uxn_device_h_l104_c7_266a_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_266a
flip_x_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_266a_cond,
flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_266a_return_output);

-- x_MUX_uxn_device_h_l104_c7_266a
x_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_266a_cond,
x_MUX_uxn_device_h_l104_c7_266a_iftrue,
x_MUX_uxn_device_h_l104_c7_266a_iffalse,
x_MUX_uxn_device_h_l104_c7_266a_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_266a
is_auto_y_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_266a
flip_y_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_266a_cond,
flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_266a_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_266a
is_auto_x_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output);

-- color_MUX_uxn_device_h_l104_c7_266a
color_MUX_uxn_device_h_l104_c7_266a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_266a_cond,
color_MUX_uxn_device_h_l104_c7_266a_iftrue,
color_MUX_uxn_device_h_l104_c7_266a_iffalse,
color_MUX_uxn_device_h_l104_c7_266a_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_06b7
CONST_SR_7_uxn_device_h_l107_c25_06b7 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_06b7_x,
CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_1c91
CONST_SR_6_uxn_device_h_l108_c21_1c91 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_1c91_x,
CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_f9e4
CONST_SR_5_uxn_device_h_l109_c22_f9e4 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_f9e4_x,
CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_bc97
CONST_SR_4_uxn_device_h_l110_c22_bc97 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_bc97_x,
CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_2aec
BIN_OP_EQ_uxn_device_h_l113_c11_2aec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left,
BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right,
BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_8bac
auto_advance_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond,
auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- result_MUX_uxn_device_h_l113_c7_8bac
result_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_8bac_cond,
result_MUX_uxn_device_h_l113_c7_8bac_iftrue,
result_MUX_uxn_device_h_l113_c7_8bac_iffalse,
result_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_8bac
tmp8_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_8bac_cond,
tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_8bac
ram_addr_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond,
ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- y_MUX_uxn_device_h_l113_c7_8bac
y_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_8bac_cond,
y_MUX_uxn_device_h_l113_c7_8bac_iftrue,
y_MUX_uxn_device_h_l113_c7_8bac_iffalse,
y_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- x_MUX_uxn_device_h_l113_c7_8bac
x_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_8bac_cond,
x_MUX_uxn_device_h_l113_c7_8bac_iftrue,
x_MUX_uxn_device_h_l113_c7_8bac_iffalse,
x_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_8bac
is_auto_y_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_8bac
is_auto_x_MUX_uxn_device_h_l113_c7_8bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_7b1b
BIN_OP_EQ_uxn_device_h_l117_c11_7b1b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left,
BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right,
BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_e64b
auto_advance_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond,
auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- result_MUX_uxn_device_h_l117_c7_e64b
result_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_e64b_cond,
result_MUX_uxn_device_h_l117_c7_e64b_iftrue,
result_MUX_uxn_device_h_l117_c7_e64b_iffalse,
result_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_e64b
tmp8_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_e64b_cond,
tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_e64b
ram_addr_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond,
ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- y_MUX_uxn_device_h_l117_c7_e64b
y_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_e64b_cond,
y_MUX_uxn_device_h_l117_c7_e64b_iftrue,
y_MUX_uxn_device_h_l117_c7_e64b_iffalse,
y_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- x_MUX_uxn_device_h_l117_c7_e64b
x_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_e64b_cond,
x_MUX_uxn_device_h_l117_c7_e64b_iftrue,
x_MUX_uxn_device_h_l117_c7_e64b_iffalse,
x_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_e64b
is_auto_y_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_e64b
is_auto_x_MUX_uxn_device_h_l117_c7_e64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43
result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43
result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43
result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_eb43
result_u16_addr_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43
result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_eb43
result_u8_value_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_eb43
tmp8_MUX_uxn_device_h_l119_c3_eb43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_eb43_cond,
tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_c151
BIN_OP_AND_uxn_device_h_l121_c11_c151 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_c151_left,
BIN_OP_AND_uxn_device_h_l121_c11_c151_right,
BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_839b
BIN_OP_PLUS_uxn_device_h_l122_c23_839b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4
result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_8eb4
tmp8_MUX_uxn_device_h_l125_c4_8eb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond,
tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output);

-- MUX_uxn_device_h_l126_c13_4d96
MUX_uxn_device_h_l126_c13_4d96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_4d96_cond,
MUX_uxn_device_h_l126_c13_4d96_iftrue,
MUX_uxn_device_h_l126_c13_4d96_iffalse,
MUX_uxn_device_h_l126_c13_4d96_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_4304
BIN_OP_OR_uxn_device_h_l126_c5_4304 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_4304_left,
BIN_OP_OR_uxn_device_h_l126_c5_4304_right,
BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output);

-- MUX_uxn_device_h_l127_c13_5fae
MUX_uxn_device_h_l127_c13_5fae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_5fae_cond,
MUX_uxn_device_h_l127_c13_5fae_iftrue,
MUX_uxn_device_h_l127_c13_5fae_iffalse,
MUX_uxn_device_h_l127_c13_5fae_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_06da
BIN_OP_OR_uxn_device_h_l127_c5_06da : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_06da_left,
BIN_OP_OR_uxn_device_h_l127_c5_06da_right,
BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_b6c3
BIN_OP_EQ_uxn_device_h_l136_c11_b6c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left,
BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right,
BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_5ac3
auto_advance_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond,
auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- result_MUX_uxn_device_h_l136_c7_5ac3
result_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_5ac3_cond,
result_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
result_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
result_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_5ac3
ram_addr_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond,
ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- y_MUX_uxn_device_h_l136_c7_5ac3
y_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_5ac3_cond,
y_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
y_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
y_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- x_MUX_uxn_device_h_l136_c7_5ac3
x_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_5ac3_cond,
x_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
x_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
x_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_5ac3
is_auto_y_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_5ac3
is_auto_x_MUX_uxn_device_h_l136_c7_5ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_c68a
CONST_SR_1_uxn_device_h_l139_c15_c68a : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_c68a_x,
CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_f491
result_device_ram_address_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_f491
result_is_deo_done_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_f491
result_u16_addr_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_f491
result_is_vram_write_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_f491
result_u8_value_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output);

-- y_MUX_uxn_device_h_l140_c3_f491
y_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_f491_cond,
y_MUX_uxn_device_h_l140_c3_f491_iftrue,
y_MUX_uxn_device_h_l140_c3_f491_iffalse,
y_MUX_uxn_device_h_l140_c3_f491_return_output);

-- x_MUX_uxn_device_h_l140_c3_f491
x_MUX_uxn_device_h_l140_c3_f491 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_f491_cond,
x_MUX_uxn_device_h_l140_c3_f491_iftrue,
x_MUX_uxn_device_h_l140_c3_f491_iffalse,
x_MUX_uxn_device_h_l140_c3_f491_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7
result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_52d7
result_u8_value_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7
result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- y_MUX_uxn_device_h_l144_c4_52d7
y_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_52d7_cond,
y_MUX_uxn_device_h_l144_c4_52d7_iftrue,
y_MUX_uxn_device_h_l144_c4_52d7_iffalse,
y_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- x_MUX_uxn_device_h_l144_c4_52d7
x_MUX_uxn_device_h_l144_c4_52d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_52d7_cond,
x_MUX_uxn_device_h_l144_c4_52d7_iftrue,
x_MUX_uxn_device_h_l144_c4_52d7_iffalse,
x_MUX_uxn_device_h_l144_c4_52d7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a
BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_392b
CONST_SR_8_uxn_device_h_l148_c33_392b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_392b_x,
CONST_SR_8_uxn_device_h_l148_c33_392b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_787b
result_device_ram_address_MUX_uxn_device_h_l149_c11_787b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_787b
result_u8_value_MUX_uxn_device_h_l149_c11_787b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_787b
result_is_deo_done_MUX_uxn_device_h_l149_c11_787b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output);

-- y_MUX_uxn_device_h_l149_c11_787b
y_MUX_uxn_device_h_l149_c11_787b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_787b_cond,
y_MUX_uxn_device_h_l149_c11_787b_iftrue,
y_MUX_uxn_device_h_l149_c11_787b_iffalse,
y_MUX_uxn_device_h_l149_c11_787b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_9796
BIN_OP_PLUS_uxn_device_h_l150_c5_9796 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_72ea
CONST_SR_8_uxn_device_h_l153_c33_72ea : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_72ea_x,
CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_ccce
BIN_OP_EQ_uxn_device_h_l161_c11_ccce : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left,
BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right,
BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output);

-- result_MUX_uxn_device_h_l161_c7_0503
result_MUX_uxn_device_h_l161_c7_0503 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_0503_cond,
result_MUX_uxn_device_h_l161_c7_0503_iftrue,
result_MUX_uxn_device_h_l161_c7_0503_iffalse,
result_MUX_uxn_device_h_l161_c7_0503_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_0503
ram_addr_MUX_uxn_device_h_l161_c7_0503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_0503_cond,
ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output);

-- y_MUX_uxn_device_h_l161_c7_0503
y_MUX_uxn_device_h_l161_c7_0503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_0503_cond,
y_MUX_uxn_device_h_l161_c7_0503_iftrue,
y_MUX_uxn_device_h_l161_c7_0503_iffalse,
y_MUX_uxn_device_h_l161_c7_0503_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3
result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_c3d3
result_u8_value_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3
result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_c3d3
ram_addr_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond,
ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- y_MUX_uxn_device_h_l162_c3_c3d3
y_MUX_uxn_device_h_l162_c3_c3d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_c3d3_cond,
y_MUX_uxn_device_h_l162_c3_c3d3_iftrue,
y_MUX_uxn_device_h_l162_c3_c3d3_iffalse,
y_MUX_uxn_device_h_l162_c3_c3d3_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_f675
result_device_ram_address_MUX_uxn_device_h_l163_c4_f675 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_f675
result_u8_value_MUX_uxn_device_h_l163_c4_f675 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_f675
result_is_deo_done_MUX_uxn_device_h_l163_c4_f675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output);

-- y_MUX_uxn_device_h_l163_c4_f675
y_MUX_uxn_device_h_l163_c4_f675 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_f675_cond,
y_MUX_uxn_device_h_l163_c4_f675_iftrue,
y_MUX_uxn_device_h_l163_c4_f675_iffalse,
y_MUX_uxn_device_h_l163_c4_f675_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_d450
UNARY_OP_NOT_uxn_device_h_l167_c27_d450 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_0207
BIN_OP_PLUS_uxn_device_h_l169_c5_0207 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_f28d
BIN_OP_EQ_uxn_device_h_l181_c11_f28d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left,
BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right,
BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output);

-- result_MUX_uxn_device_h_l181_c7_1d8a
result_MUX_uxn_device_h_l181_c7_1d8a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_1d8a_cond,
result_MUX_uxn_device_h_l181_c7_1d8a_iftrue,
result_MUX_uxn_device_h_l181_c7_1d8a_iffalse,
result_MUX_uxn_device_h_l181_c7_1d8a_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_1d8a
ram_addr_MUX_uxn_device_h_l181_c7_1d8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond,
ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_f6d9
result_u8_value_MUX_uxn_device_h_l182_c3_f6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_f6d9
ram_addr_MUX_uxn_device_h_l182_c3_f6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond,
ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_8e37
CONST_SR_8_uxn_device_h_l186_c32_8e37 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_8e37_x,
CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_2830
BIN_OP_OR_uxn_device_h_l189_c4_2830 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_2830_left,
BIN_OP_OR_uxn_device_h_l189_c4_2830_right,
BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_52f3
BIN_OP_EQ_uxn_device_h_l192_c11_52f3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left,
BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right,
BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output);

-- result_MUX_uxn_device_h_l192_c7_c53e
result_MUX_uxn_device_h_l192_c7_c53e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_c53e_cond,
result_MUX_uxn_device_h_l192_c7_c53e_iftrue,
result_MUX_uxn_device_h_l192_c7_c53e_iffalse,
result_MUX_uxn_device_h_l192_c7_c53e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da
result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_e1da
result_u8_value_MUX_uxn_device_h_l193_c3_e1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da
result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output);

-- result_MUX_uxn_device_h_l202_c3_27f4
result_MUX_uxn_device_h_l202_c3_27f4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_27f4_cond,
result_MUX_uxn_device_h_l202_c3_27f4_iftrue,
result_MUX_uxn_device_h_l202_c3_27f4_iffalse,
result_MUX_uxn_device_h_l202_c3_27f4_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_344d
BIN_OP_MINUS_uxn_device_h_l203_c58_344d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output);

-- screen_blit_uxn_device_h_l203_c46_5cd9
screen_blit_uxn_device_h_l203_c46_5cd9 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_5cd9_phase,
screen_blit_uxn_device_h_l203_c46_5cd9_ctrl,
screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance,
screen_blit_uxn_device_h_l203_c46_5cd9_x,
screen_blit_uxn_device_h_l203_c46_5cd9_y,
screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr,
screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_5cd9_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 result_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 layer_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 y_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 x_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 color_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output,
 MUX_uxn_device_h_l89_c19_10e0_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output,
 MUX_uxn_device_h_l90_c20_9310_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output,
 MUX_uxn_device_h_l95_c32_0e17_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output,
 result_MUX_uxn_device_h_l101_c7_dccb_return_output,
 layer_MUX_uxn_device_h_l101_c7_dccb_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output,
 y_MUX_uxn_device_h_l101_c7_dccb_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output,
 x_MUX_uxn_device_h_l101_c7_dccb_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output,
 color_MUX_uxn_device_h_l101_c7_dccb_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_266a_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output,
 result_MUX_uxn_device_h_l104_c7_266a_return_output,
 layer_MUX_uxn_device_h_l104_c7_266a_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_266a_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output,
 y_MUX_uxn_device_h_l104_c7_266a_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_266a_return_output,
 x_MUX_uxn_device_h_l104_c7_266a_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_266a_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output,
 color_MUX_uxn_device_h_l104_c7_266a_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output,
 result_MUX_uxn_device_h_l113_c7_8bac_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output,
 y_MUX_uxn_device_h_l113_c7_8bac_return_output,
 x_MUX_uxn_device_h_l113_c7_8bac_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output,
 result_MUX_uxn_device_h_l117_c7_e64b_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output,
 y_MUX_uxn_device_h_l117_c7_e64b_return_output,
 x_MUX_uxn_device_h_l117_c7_e64b_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output,
 MUX_uxn_device_h_l126_c13_4d96_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output,
 MUX_uxn_device_h_l127_c13_5fae_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 result_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 y_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 x_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output,
 y_MUX_uxn_device_h_l140_c3_f491_return_output,
 x_MUX_uxn_device_h_l140_c3_f491_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output,
 y_MUX_uxn_device_h_l144_c4_52d7_return_output,
 x_MUX_uxn_device_h_l144_c4_52d7_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_392b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output,
 y_MUX_uxn_device_h_l149_c11_787b_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output,
 result_MUX_uxn_device_h_l161_c7_0503_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output,
 y_MUX_uxn_device_h_l161_c7_0503_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 y_MUX_uxn_device_h_l162_c3_c3d3_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output,
 y_MUX_uxn_device_h_l163_c4_f675_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output,
 result_MUX_uxn_device_h_l181_c7_1d8a_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output,
 result_MUX_uxn_device_h_l192_c7_c53e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output,
 result_MUX_uxn_device_h_l202_c3_27f4_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output,
 screen_blit_uxn_device_h_l203_c46_5cd9_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_bbd5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_dccb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_bbd5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_dccb_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_10e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_10e0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_10e0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_10e0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_9310_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_9310_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_9310_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_9310_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0e17_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0e17_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0e17_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_0e17_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_dccb_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_dccb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_dccb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_266a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_dccb_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_dccb_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_266a_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_dccb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_266a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_266a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_266a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_8bac_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_266a_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_266a_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_266a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_173d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_7820_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_9d03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_87c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_55b0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_8bac_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_8bac_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_8bac_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_e64b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_e64b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f540_uxn_device_h_l117_c7_e64b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_e64b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_5ac3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_d487 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_a245 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_9ddc : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output : unsigned(16 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_4d96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_4d96_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_4d96_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_4d96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_5fae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_5fae_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_5fae_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_5fae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_9b40 : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a_uxn_device_h_l136_c7_5ac3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_0503_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_0503_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_6b58 : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_5b10 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_x : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_54bf : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_f491_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_52d7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_f491_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_f491_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_8a92 : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_787b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_52d7_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_b3e5 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_52d7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_52d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4591_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_787b_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_3396 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_787b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_787b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_40ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_0503_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l161_c7_0503_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_0503_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_1d8a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_0503_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_0503_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f675_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_c3d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f675_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f675_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_99fd : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f675_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_fa9f_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_60fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_1d8a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c53e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_45be_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_c53e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l192_c7_c53e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c53e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_27f4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b655_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_27f4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_27f4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_27f4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_27f4_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_c0bd : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_8ea7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_50cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_6caa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_ee88_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_61cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_50fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_35d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_9310_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_right := to_unsigned(3, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue := to_unsigned(42, 8);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_c0bd := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l89_c19_10e0_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right := to_unsigned(3, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue := to_unsigned(41, 8);
     VAR_MUX_uxn_device_h_l127_c13_5fae_iffalse := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue := to_unsigned(42, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse := to_unsigned(44, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right := to_unsigned(5, 8);
     VAR_MUX_uxn_device_h_l89_c19_10e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right := to_unsigned(8, 8);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_d487 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_d487;
     VAR_MUX_uxn_device_h_l126_c13_4d96_iftrue := to_unsigned(24, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse := to_unsigned(45, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right := to_unsigned(15, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right := to_unsigned(14, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_9310_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue := to_unsigned(1, 1);
     VAR_result_u16_addr_uxn_device_h_l142_c4_54bf := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_54bf;
     VAR_MUX_uxn_device_h_l126_c13_4d96_iffalse := to_unsigned(16, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse := to_unsigned(43, 8);
     VAR_MUX_uxn_device_h_l127_c13_5fae_iftrue := to_unsigned(4, 8);
     VAR_MUX_uxn_device_h_l95_c32_0e17_iftrue := to_unsigned(46, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_0e17_iffalse := to_unsigned(47, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l143_c4_8a92 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_8a92;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_dccb_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_266a_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_4d96_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_5fae_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_f675_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_f491_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_c3d3_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_27f4_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_266a_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_9b40 := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_27f4_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_dccb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_266a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_e64b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_f491_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_52d7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_dccb_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_266a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_8bac_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_f491_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_52d7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_787b_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_0503_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_f675_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_x := VAR_auto_advance_uxn_device_h_l137_c3_9b40;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_9b40;
     VAR_is_auto_x_uxn_device_h_l138_c3_5b10 := resize(VAR_auto_advance_uxn_device_h_l137_c3_9b40, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_x_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     VAR_y_MUX_uxn_device_h_l144_c4_52d7_cond := VAR_is_auto_x_uxn_device_h_l138_c3_5b10;
     -- BIN_OP_EQ[uxn_device_h_l113_c11_2aec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_17b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_4c54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_50fa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_50fa_return_output := result.u16_addr;

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_0207] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output;

     -- CONST_SR_8[uxn_device_h_l186_c32_8e37] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_8e37_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output := CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_b655] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b655_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_SR_4[uxn_device_h_l110_c22_bc97] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_bc97_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output := CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_fa9f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_fa9f_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_35d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_35d8_return_output := result.is_vram_write;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_eb43] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_eb43_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output := result.u8_value;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_344d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- CONST_SR_1[uxn_device_h_l139_c15_c68a] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_c68a_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output := CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_f9e4] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_f9e4_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output := CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_d450] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output;

     -- CONST_SR_6[uxn_device_h_l108_c21_1c91] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_1c91_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output := CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output;

     -- MUX[uxn_device_h_l126_c13_4d96] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_4d96_cond <= VAR_MUX_uxn_device_h_l126_c13_4d96_cond;
     MUX_uxn_device_h_l126_c13_4d96_iftrue <= VAR_MUX_uxn_device_h_l126_c13_4d96_iftrue;
     MUX_uxn_device_h_l126_c13_4d96_iffalse <= VAR_MUX_uxn_device_h_l126_c13_4d96_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_4d96_return_output := MUX_uxn_device_h_l126_c13_4d96_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_7b1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_266a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_266a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_9796] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_383b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_383b_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_383b_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_7d1a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_c9a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_b6c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output := result.is_deo_done;

     -- BIN_OP_AND[uxn_device_h_l121_c11_c151] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_c151_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_left;
     BIN_OP_AND_uxn_device_h_l121_c11_c151_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output := BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_52f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_8bac] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_8bac_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_dccb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_dccb_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l161_c11_ccce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_f675] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_26d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output;

     -- MUX[uxn_device_h_l127_c13_5fae] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_5fae_cond <= VAR_MUX_uxn_device_h_l127_c13_5fae_cond;
     MUX_uxn_device_h_l127_c13_5fae_iftrue <= VAR_MUX_uxn_device_h_l127_c13_5fae_iftrue;
     MUX_uxn_device_h_l127_c13_5fae_iffalse <= VAR_MUX_uxn_device_h_l127_c13_5fae_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_5fae_return_output := MUX_uxn_device_h_l127_c13_5fae_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_173d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_173d_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_7[uxn_device_h_l107_c25_06b7] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_06b7_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output := CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_f28d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_f675] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_9ddc := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_c151_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_383b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_266a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c9a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_8bac_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_2aec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_7b1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_5ac3_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_b6c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_0503_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_0503_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ccce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_1d8a_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_f28d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_52f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_bbd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_17b3_return_output;
     VAR_MUX_uxn_device_h_l89_c19_10e0_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_4c54_return_output;
     VAR_MUX_uxn_device_h_l90_c20_9310_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_26d5_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_344d_return_output;
     VAR_x_uxn_device_h_l145_c5_b3e5 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_7d1a_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_3396 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9796_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_99fd := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_0207_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_8bac_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_e64b_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l114_l189_l118_DUPLICATE_8778_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_173d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_fa9f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_b655_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_50fa_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_50fa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l193_l125_l149_l162_l144_DUPLICATE_e424_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l149_l162_DUPLICATE_75e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_35d8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_35d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l149_l162_l94_DUPLICATE_ba0d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_2231_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_6b58 := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_c68a_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_right := VAR_MUX_uxn_device_h_l126_c13_4d96_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_right := VAR_MUX_uxn_device_h_l127_c13_5fae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_d450_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_dccb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_dccb_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_266a_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_8bac_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_8bac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f675_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f675_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_eb43_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_y_MUX_uxn_device_h_l149_c11_787b_cond := VAR_is_auto_y_uxn_device_h_l139_c3_6b58;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_left := VAR_tmp8_uxn_device_h_l121_c4_9ddc;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse := VAR_tmp8_uxn_device_h_l121_c4_9ddc;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_x := VAR_x_uxn_device_h_l145_c5_b3e5;
     VAR_x_MUX_uxn_device_h_l144_c4_52d7_iftrue := VAR_x_uxn_device_h_l145_c5_b3e5;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_x := VAR_y_uxn_device_h_l150_c5_3396;
     VAR_y_MUX_uxn_device_h_l149_c11_787b_iftrue := VAR_y_uxn_device_h_l150_c5_3396;
     VAR_y_MUX_uxn_device_h_l163_c4_f675_iffalse := VAR_y_uxn_device_h_l169_c5_99fd;
     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_8eb4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_787b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_e1da] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_60fb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_60fb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_99fd);

     -- BIN_OP_OR[uxn_device_h_l126_c5_4304] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_4304_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_left;
     BIN_OP_OR_uxn_device_h_l126_c5_4304_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output := BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_9d03] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_9d03_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_1c91_return_output);

     -- y_MUX[uxn_device_h_l163_c4_f675] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_f675_cond <= VAR_y_MUX_uxn_device_h_l163_c4_f675_cond;
     y_MUX_uxn_device_h_l163_c4_f675_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_f675_iftrue;
     y_MUX_uxn_device_h_l163_c4_f675_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_f675_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_f675_return_output := y_MUX_uxn_device_h_l163_c4_f675_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- MUX[uxn_device_h_l89_c19_10e0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_10e0_cond <= VAR_MUX_uxn_device_h_l89_c19_10e0_cond;
     MUX_uxn_device_h_l89_c19_10e0_iftrue <= VAR_MUX_uxn_device_h_l89_c19_10e0_iftrue;
     MUX_uxn_device_h_l89_c19_10e0_iffalse <= VAR_MUX_uxn_device_h_l89_c19_10e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_10e0_return_output := MUX_uxn_device_h_l89_c19_10e0_return_output;

     -- MUX[uxn_device_h_l90_c20_9310] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_9310_cond <= VAR_MUX_uxn_device_h_l90_c20_9310_cond;
     MUX_uxn_device_h_l90_c20_9310_iftrue <= VAR_MUX_uxn_device_h_l90_c20_9310_iftrue;
     MUX_uxn_device_h_l90_c20_9310_iffalse <= VAR_MUX_uxn_device_h_l90_c20_9310_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_9310_return_output := MUX_uxn_device_h_l90_c20_9310_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_787b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_87c5] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_87c5_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f9e4_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_45be] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_45be_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_8e37_return_output);

     -- ctrl_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_cond;
     ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_return_output := ctrl_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- x_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_x_MUX_uxn_device_h_l144_c4_52d7_cond;
     x_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     x_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_52d7_return_output := x_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_f675] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_7820] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_7820_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_06b7_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_f6d9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_e1da] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_2830] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_2830_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_left;
     BIN_OP_OR_uxn_device_h_l189_c4_2830_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output := BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_e1da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output := auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_e1da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output;

     -- color_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_color_MUX_uxn_device_h_l104_c7_266a_cond;
     color_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_266a_iftrue;
     color_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_266a_return_output := color_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_55b0] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_55b0_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bc97_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- y_MUX[uxn_device_h_l149_c11_787b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_787b_cond <= VAR_y_MUX_uxn_device_h_l149_c11_787b_cond;
     y_MUX_uxn_device_h_l149_c11_787b_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_787b_iftrue;
     y_MUX_uxn_device_h_l149_c11_787b_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_787b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_787b_return_output := y_MUX_uxn_device_h_l149_c11_787b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_f6d9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_787b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output;

     -- CONST_SR_8[uxn_device_h_l153_c33_72ea] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_72ea_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output := CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output;

     -- CONST_SR_8[uxn_device_h_l148_c33_392b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_392b_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_return_output := CONST_SR_8_uxn_device_h_l148_c33_392b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_4304_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_2830_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_7820_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_9d03_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_87c5_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_55b0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_60fb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_45be_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_fc7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_left := VAR_MUX_uxn_device_h_l89_c19_10e0_return_output;
     VAR_MUX_uxn_device_h_l95_c32_0e17_cond := VAR_MUX_uxn_device_h_l89_c19_10e0_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue := VAR_MUX_uxn_device_h_l89_c19_10e0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_right := VAR_MUX_uxn_device_h_l90_c20_9310_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue := VAR_MUX_uxn_device_h_l90_c20_9310_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_787b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_8eb4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_787b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f675_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_787b_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_52d7_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_787b_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_f675_return_output;
     -- ctrl_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_cond;
     ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output := ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_cond;
     flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_return_output := flip_y_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_839b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_4591] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4591_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_392b_return_output);

     -- is_auto_x_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- ram_addr_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output := ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- y_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_y_MUX_uxn_device_h_l162_c3_c3d3_cond;
     y_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     y_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_c3d3_return_output := y_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_266a_cond;
     layer_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_266a_iftrue;
     layer_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_266a_return_output := layer_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- MUX[uxn_device_h_l95_c32_0e17] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_0e17_cond <= VAR_MUX_uxn_device_h_l95_c32_0e17_cond;
     MUX_uxn_device_h_l95_c32_0e17_iftrue <= VAR_MUX_uxn_device_h_l95_c32_0e17_iftrue;
     MUX_uxn_device_h_l95_c32_0e17_iffalse <= VAR_MUX_uxn_device_h_l95_c32_0e17_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_0e17_return_output := MUX_uxn_device_h_l95_c32_0e17_return_output;

     -- result_u8_value_MUX[uxn_device_h_l163_c4_f675] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- color_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_color_MUX_uxn_device_h_l101_c7_dccb_cond;
     color_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     color_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_dccb_return_output := color_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l182_c3_f6d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- x_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_x_MUX_uxn_device_h_l140_c3_f491_cond;
     x_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_f491_iftrue;
     x_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_f491_return_output := x_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output := auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- is_auto_y_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_5f44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_5f44_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_left;
     BIN_OP_OR_uxn_device_h_l91_c21_5f44_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output := BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_40ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_40ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_72ea_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4[uxn_device_h_l192_c7_c53e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l192_c7_c53e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_e1da_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_e1da_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_e1da_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_e1da_return_output);

     -- y_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_y_MUX_uxn_device_h_l144_c4_52d7_cond;
     y_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     y_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_52d7_return_output := y_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- BIN_OP_OR[uxn_device_h_l127_c5_06da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_06da_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_left;
     BIN_OP_OR_uxn_device_h_l127_c5_06da_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output := BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_f6d9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output := ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_cond;
     flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_return_output := flip_x_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_06da_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5f44_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_a245 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_839b_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_4591_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_40ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue := VAR_MUX_uxn_device_h_l95_c32_0e17_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_e64b_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_c3d3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6d9_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_c53e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l192_c7_c53e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f675_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_f491_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_0503_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_c3d3_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_a245;
     -- result_u8_value_MUX[uxn_device_h_l162_c3_c3d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- ram_addr_MUX[uxn_device_h_l181_c7_1d8a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output := ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_8b4b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l181_c7_1d8a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_1d8a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6d9_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6d9_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6d9_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- x_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_x_MUX_uxn_device_h_l136_c7_5ac3_cond;
     x_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     x_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_5ac3_return_output := x_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_8b4b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_8eb4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_cond;
     tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output := tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- color_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_color_MUX_uxn_device_h_l88_c2_bbd5_cond;
     color_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     color_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_bbd5_return_output := color_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_cond;
     flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output := flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_cond;
     ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output := ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output := auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_cond;
     flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output := flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_dccb_cond;
     layer_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     layer_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_dccb_return_output := layer_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_787b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output;

     -- y_MUX[uxn_device_h_l161_c7_0503] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_0503_cond <= VAR_y_MUX_uxn_device_h_l161_c7_0503_cond;
     y_MUX_uxn_device_h_l161_c7_0503_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_0503_iftrue;
     y_MUX_uxn_device_h_l161_c7_0503_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_0503_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_0503_return_output := y_MUX_uxn_device_h_l161_c7_0503_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- y_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_y_MUX_uxn_device_h_l140_c3_f491_cond;
     y_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_f491_iftrue;
     y_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_f491_return_output := y_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_8bac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_8bac_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_8bac_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_8bac_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_1d8a_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_1d8a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_787b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_8eb4_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_f491_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_0503_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l88_c2_bbd5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_bbd5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_8b4b_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_8b4b_return_output);

     -- layer_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_cond;
     layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_return_output := layer_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- x_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_x_MUX_uxn_device_h_l117_c7_e64b_cond;
     x_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     x_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_e64b_return_output := x_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- y_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_y_MUX_uxn_device_h_l136_c7_5ac3_cond;
     y_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     y_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_5ac3_return_output := y_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- ram_addr_MUX[uxn_device_h_l161_c7_0503] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_0503_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output := ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_eb43] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_eb43_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_cond;
     tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output := tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_cond;
     flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output := flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_52d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output := auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- is_auto_x_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4[uxn_device_h_l161_c7_0503] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l161_c7_0503_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_c3d3_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_c3d3_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_c3d3_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_c3d3_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_cond;
     flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output := flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_266a_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_266a_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_0503_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_0503_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_eaf4_uxn_device_h_l161_c7_0503_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_52d7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_eb43_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     -- result_u8_value_MUX[uxn_device_h_l140_c3_f491] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output := auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- is_auto_x_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_cond;
     tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output := tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- x_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_x_MUX_uxn_device_h_l113_c7_8bac_cond;
     x_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     x_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_8bac_return_output := x_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f540[uxn_device_h_l117_c7_e64b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f540_uxn_device_h_l117_c7_e64b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_f540(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_eb43_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_eb43_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_eb43_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_eb43_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_eb43_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_eb43_return_output);

     -- is_auto_y_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- y_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_y_MUX_uxn_device_h_l117_c7_e64b_cond;
     y_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     y_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_e64b_return_output := y_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output := ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_e64b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f540_uxn_device_h_l117_c7_e64b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_8bac_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_e64b_return_output;
     -- y_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_y_MUX_uxn_device_h_l113_c7_8bac_cond;
     y_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     y_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_8bac_return_output := y_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output := ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a[uxn_device_h_l136_c7_5ac3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a_uxn_device_h_l136_c7_5ac3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_f491_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_f491_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_f491_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_f491_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_f491_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_f491_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_0503] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_cond;
     tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output := tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- x_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_x_MUX_uxn_device_h_l104_c7_266a_cond;
     x_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_266a_iftrue;
     x_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_266a_return_output := x_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output := auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_0503_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_e64b_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ef3a_uxn_device_h_l136_c7_5ac3_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_8bac_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_8bac_return_output;
     -- x_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_x_MUX_uxn_device_h_l101_c7_dccb_cond;
     x_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     x_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_dccb_return_output := x_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- y_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_y_MUX_uxn_device_h_l104_c7_266a_cond;
     y_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_266a_iftrue;
     y_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_266a_return_output := y_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output := ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_1d8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_cond;
     tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_return_output := tmp8_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_1d8a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_8bac_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_dccb_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_266a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_c53e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output;

     -- tmp8_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_cond;
     tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output := tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output := ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- x_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_x_MUX_uxn_device_h_l88_c2_bbd5_cond;
     x_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     x_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_bbd5_return_output := x_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- y_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_y_MUX_uxn_device_h_l101_c7_dccb_cond;
     y_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     y_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_dccb_return_output := y_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c53e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_266a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_dccb_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_dccb_return_output;
     -- tmp8_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_cond;
     tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output := tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_c7b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output;

     -- y_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_y_MUX_uxn_device_h_l88_c2_bbd5_cond;
     y_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     y_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_bbd5_return_output := y_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output := ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_c7b7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_dccb_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_4bca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output;

     -- ram_addr_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output := ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_4bca_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     -- screen_blit[uxn_device_h_l203_c46_5cd9] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_5cd9_phase <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_phase;
     screen_blit_uxn_device_h_l203_c46_5cd9_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ctrl;
     screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_auto_advance;
     screen_blit_uxn_device_h_l203_c46_5cd9_x <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_x;
     screen_blit_uxn_device_h_l203_c46_5cd9_y <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_y;
     screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_ram_addr;
     screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_5cd9_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output := screen_blit_uxn_device_h_l203_c46_5cd9_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_6caa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_6caa_return_output := VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_50cb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_50cb_return_output := VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_61cc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_61cc_return_output := VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output.is_blit_done;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_8ea7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_8ea7_return_output := VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_ee88] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_ee88_return_output := VAR_screen_blit_uxn_device_h_l203_c46_5cd9_return_output.u8_value;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_27f4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_27f4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_c0bd,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_8ea7_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_50cb_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_6caa_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_ee88_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_61cc_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_27f4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_27f4_return_output;
     -- result_MUX[uxn_device_h_l202_c3_27f4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_27f4_cond <= VAR_result_MUX_uxn_device_h_l202_c3_27f4_cond;
     result_MUX_uxn_device_h_l202_c3_27f4_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_27f4_iftrue;
     result_MUX_uxn_device_h_l202_c3_27f4_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_27f4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_27f4_return_output := result_MUX_uxn_device_h_l202_c3_27f4_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_c53e_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_27f4_return_output;
     -- result_MUX[uxn_device_h_l192_c7_c53e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_c53e_cond <= VAR_result_MUX_uxn_device_h_l192_c7_c53e_cond;
     result_MUX_uxn_device_h_l192_c7_c53e_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_c53e_iftrue;
     result_MUX_uxn_device_h_l192_c7_c53e_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_c53e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_c53e_return_output := result_MUX_uxn_device_h_l192_c7_c53e_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_c53e_return_output;
     -- result_MUX[uxn_device_h_l181_c7_1d8a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_1d8a_cond <= VAR_result_MUX_uxn_device_h_l181_c7_1d8a_cond;
     result_MUX_uxn_device_h_l181_c7_1d8a_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iftrue;
     result_MUX_uxn_device_h_l181_c7_1d8a_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_1d8a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_1d8a_return_output := result_MUX_uxn_device_h_l181_c7_1d8a_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_0503_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_1d8a_return_output;
     -- result_MUX[uxn_device_h_l161_c7_0503] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_0503_cond <= VAR_result_MUX_uxn_device_h_l161_c7_0503_cond;
     result_MUX_uxn_device_h_l161_c7_0503_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_0503_iftrue;
     result_MUX_uxn_device_h_l161_c7_0503_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_0503_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_0503_return_output := result_MUX_uxn_device_h_l161_c7_0503_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_0503_return_output;
     -- result_MUX[uxn_device_h_l136_c7_5ac3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_5ac3_cond <= VAR_result_MUX_uxn_device_h_l136_c7_5ac3_cond;
     result_MUX_uxn_device_h_l136_c7_5ac3_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iftrue;
     result_MUX_uxn_device_h_l136_c7_5ac3_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_5ac3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_5ac3_return_output := result_MUX_uxn_device_h_l136_c7_5ac3_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_e64b_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_5ac3_return_output;
     -- result_MUX[uxn_device_h_l117_c7_e64b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_e64b_cond <= VAR_result_MUX_uxn_device_h_l117_c7_e64b_cond;
     result_MUX_uxn_device_h_l117_c7_e64b_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_e64b_iftrue;
     result_MUX_uxn_device_h_l117_c7_e64b_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_e64b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_e64b_return_output := result_MUX_uxn_device_h_l117_c7_e64b_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_8bac_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_e64b_return_output;
     -- result_MUX[uxn_device_h_l113_c7_8bac] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_8bac_cond <= VAR_result_MUX_uxn_device_h_l113_c7_8bac_cond;
     result_MUX_uxn_device_h_l113_c7_8bac_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_8bac_iftrue;
     result_MUX_uxn_device_h_l113_c7_8bac_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_8bac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_8bac_return_output := result_MUX_uxn_device_h_l113_c7_8bac_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_266a_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_8bac_return_output;
     -- result_MUX[uxn_device_h_l104_c7_266a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_266a_cond <= VAR_result_MUX_uxn_device_h_l104_c7_266a_cond;
     result_MUX_uxn_device_h_l104_c7_266a_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_266a_iftrue;
     result_MUX_uxn_device_h_l104_c7_266a_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_266a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_266a_return_output := result_MUX_uxn_device_h_l104_c7_266a_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_dccb_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_266a_return_output;
     -- result_MUX[uxn_device_h_l101_c7_dccb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_dccb_cond <= VAR_result_MUX_uxn_device_h_l101_c7_dccb_cond;
     result_MUX_uxn_device_h_l101_c7_dccb_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_dccb_iftrue;
     result_MUX_uxn_device_h_l101_c7_dccb_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_dccb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_dccb_return_output := result_MUX_uxn_device_h_l101_c7_dccb_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_dccb_return_output;
     -- result_MUX[uxn_device_h_l88_c2_bbd5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_bbd5_cond <= VAR_result_MUX_uxn_device_h_l88_c2_bbd5_cond;
     result_MUX_uxn_device_h_l88_c2_bbd5_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iftrue;
     result_MUX_uxn_device_h_l88_c2_bbd5_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_bbd5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_bbd5_return_output := result_MUX_uxn_device_h_l88_c2_bbd5_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_bbd5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_bbd5_return_output;
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
