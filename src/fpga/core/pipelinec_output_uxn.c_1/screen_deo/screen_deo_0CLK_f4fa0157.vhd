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
-- BIN_OP_EQ[uxn_device_h_l88_c6_5f78]
signal BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_050d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_3e14]
signal tmp8_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_3e14]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_3e14]
signal y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_3e14]
signal flip_y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_3e14]
signal x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_3e14]
signal ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_3e14]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_3e14]
signal ctrl_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_3e14]
signal auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l88_c2_3e14]
signal color_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(3 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_3e14]
signal is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_3e14]
signal layer_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_3e14]
signal is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_3e14]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_3e14]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l88_c2_3e14]
signal result_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_3e14_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_3e14_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_3e14_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l88_c2_3e14]
signal flip_x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_591a]
signal BIN_OP_EQ_uxn_device_h_l89_c19_591a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_591a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_2900]
signal MUX_uxn_device_h_l89_c19_2900_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_2900_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_2900_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_2900_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_7a6e]
signal BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_307b]
signal MUX_uxn_device_h_l90_c20_307b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_307b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_307b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_307b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_54dc]
signal BIN_OP_OR_uxn_device_h_l91_c21_54dc_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_54dc_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_9743]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_9743]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l95_c32_b5c8]
signal MUX_uxn_device_h_l95_c32_b5c8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_b5c8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_b5c8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_b5c8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_7895]
signal BIN_OP_EQ_uxn_device_h_l101_c11_7895_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_7895_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_be59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_050d]
signal tmp8_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_050d]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_050d]
signal y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_050d]
signal flip_y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l101_c7_050d]
signal x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_050d]
signal ram_addr_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_050d]
signal ctrl_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_050d]
signal auto_advance_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l101_c7_050d]
signal color_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(3 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_050d]
signal is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_050d]
signal layer_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_050d]
signal is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l101_c7_050d]
signal result_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_050d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_050d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_050d_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l101_c7_050d]
signal flip_x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_c8c8]
signal BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_5d30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_be59]
signal tmp8_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_be59]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l104_c7_be59]
signal y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_be59]
signal flip_y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l104_c7_be59]
signal x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_be59]
signal ram_addr_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_be59]
signal ctrl_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_be59]
signal auto_advance_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l104_c7_be59]
signal color_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(3 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_be59]
signal is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_be59]
signal layer_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_be59]
signal is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l104_c7_be59]
signal result_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_be59_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_be59_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_be59_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l104_c7_be59]
signal flip_x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_ea8a]
signal CONST_SR_7_uxn_device_h_l107_c25_ea8a_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_e767]
signal CONST_SR_6_uxn_device_h_l108_c21_e767_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_e767_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_037a]
signal CONST_SR_5_uxn_device_h_l109_c22_037a_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_037a_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_9700]
signal CONST_SR_4_uxn_device_h_l110_c22_9700_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_9700_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_a37b]
signal BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_8cbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_5d30]
signal tmp8_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l113_c7_5d30]
signal y_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l113_c7_5d30]
signal x_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_5d30]
signal ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_5d30]
signal auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_5d30]
signal is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_5d30]
signal is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l113_c7_5d30]
signal result_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_5d30_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_5d30_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_5d30_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l117_c11_6dd6]
signal BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_8847]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_8cbb]
signal tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l117_c7_8cbb]
signal y_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l117_c7_8cbb]
signal x_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_8cbb]
signal ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_8cbb]
signal auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_8cbb]
signal is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l117_c7_8cbb]
signal is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l117_c7_8cbb]
signal result_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_8cbb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_8cbb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_8cbb_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l119_c3_c909]
signal tmp8_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_c909]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_c909]
signal result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_c909]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_c909]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_c909]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_c909]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_0cb5]
signal BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_f717]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_177f]
signal tmp8_MUX_uxn_device_h_l125_c4_177f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_177f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_177f]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l126_c13_b92c]
signal MUX_uxn_device_h_l126_c13_b92c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_b92c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_b92c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_b92c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_2ad8]
signal BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_1477]
signal MUX_uxn_device_h_l127_c13_1477_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_1477_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_1477_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_1477_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_2434]
signal BIN_OP_OR_uxn_device_h_l127_c5_2434_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_2434_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_f3a7]
signal BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_e3f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l136_c7_8847]
signal y_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l136_c7_8847]
signal x_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l136_c7_8847]
signal ram_addr_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_8847]
signal auto_advance_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l136_c7_8847]
signal is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l136_c7_8847]
signal is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l136_c7_8847]
signal result_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_8847_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_8847_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_8847_return_output : device_out_result_t;

-- CONST_SR_1[uxn_device_h_l139_c15_6e3c]
signal CONST_SR_1_uxn_device_h_l139_c15_6e3c_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l140_c3_e32f]
signal y_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l140_c3_e32f]
signal x_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_e32f]
signal result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_e32f]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_e32f]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_e32f]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_e32f]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_e32f]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l144_c4_6371]
signal y_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l144_c4_6371]
signal x_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_6371]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_6371]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_6371]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_6371]
signal result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_5d10]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_ffa5]
signal CONST_SR_8_uxn_device_h_l148_c33_ffa5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l149_c11_4601]
signal y_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_4601]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_4601]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_4601]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_4601]
signal result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_2819]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_64ed]
signal CONST_SR_8_uxn_device_h_l153_c33_64ed_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_ba24]
signal BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_4433]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l161_c7_e3f5]
signal y_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l161_c7_e3f5]
signal ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l161_c7_e3f5]
signal result_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_e3f5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_e3f5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_e3f5_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l162_c3_d34a]
signal y_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l162_c3_d34a]
signal ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_d34a]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_d34a]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_d34a]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_d34a]
signal result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l163_c4_f8f7]
signal y_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_f8f7]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_f8f7]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_f8f7]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_f8f7]
signal result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_72b9]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_d83b]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_d683]
signal BIN_OP_EQ_uxn_device_h_l181_c11_d683_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_d683_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_c957]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l181_c7_4433]
signal ram_addr_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l181_c7_4433]
signal result_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_4433_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_4433_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_4433_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l182_c3_1849]
signal ram_addr_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_1849]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_1849]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_1849]
signal result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_b63d]
signal CONST_SR_8_uxn_device_h_l186_c32_b63d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_8ac0]
signal BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_b6c3]
signal BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_1933]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_c957]
signal result_MUX_uxn_device_h_l192_c7_c957_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_c957_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_c957_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_c957_return_output : device_out_result_t;

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_3e3e]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_3e3e]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_3e3e]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_3e3e]
signal result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_7c6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_868e]
signal result_MUX_uxn_device_h_l202_c3_868e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_868e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_868e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_868e_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_73ca]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_b04a]
signal screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b04a_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output : unsigned(15 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_34f0( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_3;
      base.device_ram_address := ref_toks_4;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_e625( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_3;
      base.u16_addr := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_write_layer := ref_toks_6;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_cebc( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_vram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_1b27( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_deo_done := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u8_value := ref_toks_4;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_5f78
BIN_OP_EQ_uxn_device_h_l88_c6_5f78 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left,
BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right,
BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_3e14
tmp8_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_3e14_cond,
tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_3e14
ctrl_mode_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- y_MUX_uxn_device_h_l88_c2_3e14
y_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_3e14_cond,
y_MUX_uxn_device_h_l88_c2_3e14_iftrue,
y_MUX_uxn_device_h_l88_c2_3e14_iffalse,
y_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_3e14
flip_y_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_3e14_cond,
flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- x_MUX_uxn_device_h_l88_c2_3e14
x_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_3e14_cond,
x_MUX_uxn_device_h_l88_c2_3e14_iftrue,
x_MUX_uxn_device_h_l88_c2_3e14_iffalse,
x_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_3e14
ram_addr_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond,
ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_3e14
is_sprite_port_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_3e14
ctrl_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_3e14_cond,
ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_3e14
auto_advance_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond,
auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- color_MUX_uxn_device_h_l88_c2_3e14
color_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_3e14_cond,
color_MUX_uxn_device_h_l88_c2_3e14_iftrue,
color_MUX_uxn_device_h_l88_c2_3e14_iffalse,
color_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_3e14
is_auto_y_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- layer_MUX_uxn_device_h_l88_c2_3e14
layer_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_3e14_cond,
layer_MUX_uxn_device_h_l88_c2_3e14_iftrue,
layer_MUX_uxn_device_h_l88_c2_3e14_iffalse,
layer_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_3e14
is_auto_x_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_3e14
is_pixel_port_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_3e14
is_drawing_port_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- result_MUX_uxn_device_h_l88_c2_3e14
result_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_3e14_cond,
result_MUX_uxn_device_h_l88_c2_3e14_iftrue,
result_MUX_uxn_device_h_l88_c2_3e14_iffalse,
result_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_3e14
flip_x_MUX_uxn_device_h_l88_c2_3e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_3e14_cond,
flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_591a
BIN_OP_EQ_uxn_device_h_l89_c19_591a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_591a_left,
BIN_OP_EQ_uxn_device_h_l89_c19_591a_right,
BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output);

-- MUX_uxn_device_h_l89_c19_2900
MUX_uxn_device_h_l89_c19_2900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_2900_cond,
MUX_uxn_device_h_l89_c19_2900_iftrue,
MUX_uxn_device_h_l89_c19_2900_iffalse,
MUX_uxn_device_h_l89_c19_2900_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_7a6e
BIN_OP_EQ_uxn_device_h_l90_c20_7a6e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left,
BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right,
BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output);

-- MUX_uxn_device_h_l90_c20_307b
MUX_uxn_device_h_l90_c20_307b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_307b_cond,
MUX_uxn_device_h_l90_c20_307b_iftrue,
MUX_uxn_device_h_l90_c20_307b_iffalse,
MUX_uxn_device_h_l90_c20_307b_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_54dc
BIN_OP_OR_uxn_device_h_l91_c21_54dc : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_54dc_left,
BIN_OP_OR_uxn_device_h_l91_c21_54dc_right,
BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_9743
result_is_deo_done_MUX_uxn_device_h_l94_c3_9743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_9743
result_device_ram_address_MUX_uxn_device_h_l94_c3_9743 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output);

-- MUX_uxn_device_h_l95_c32_b5c8
MUX_uxn_device_h_l95_c32_b5c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_b5c8_cond,
MUX_uxn_device_h_l95_c32_b5c8_iftrue,
MUX_uxn_device_h_l95_c32_b5c8_iffalse,
MUX_uxn_device_h_l95_c32_b5c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_7895
BIN_OP_EQ_uxn_device_h_l101_c11_7895 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_7895_left,
BIN_OP_EQ_uxn_device_h_l101_c11_7895_right,
BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_050d
tmp8_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_050d_cond,
tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_050d_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_050d
ctrl_mode_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output);

-- y_MUX_uxn_device_h_l101_c7_050d
y_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_050d_cond,
y_MUX_uxn_device_h_l101_c7_050d_iftrue,
y_MUX_uxn_device_h_l101_c7_050d_iffalse,
y_MUX_uxn_device_h_l101_c7_050d_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_050d
flip_y_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_050d_cond,
flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_050d_return_output);

-- x_MUX_uxn_device_h_l101_c7_050d
x_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_050d_cond,
x_MUX_uxn_device_h_l101_c7_050d_iftrue,
x_MUX_uxn_device_h_l101_c7_050d_iffalse,
x_MUX_uxn_device_h_l101_c7_050d_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_050d
ram_addr_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_050d_cond,
ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_050d
ctrl_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_050d_cond,
ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_050d_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_050d
auto_advance_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_050d_cond,
auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output);

-- color_MUX_uxn_device_h_l101_c7_050d
color_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_050d_cond,
color_MUX_uxn_device_h_l101_c7_050d_iftrue,
color_MUX_uxn_device_h_l101_c7_050d_iffalse,
color_MUX_uxn_device_h_l101_c7_050d_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_050d
is_auto_y_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output);

-- layer_MUX_uxn_device_h_l101_c7_050d
layer_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_050d_cond,
layer_MUX_uxn_device_h_l101_c7_050d_iftrue,
layer_MUX_uxn_device_h_l101_c7_050d_iffalse,
layer_MUX_uxn_device_h_l101_c7_050d_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_050d
is_auto_x_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output);

-- result_MUX_uxn_device_h_l101_c7_050d
result_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_050d_cond,
result_MUX_uxn_device_h_l101_c7_050d_iftrue,
result_MUX_uxn_device_h_l101_c7_050d_iffalse,
result_MUX_uxn_device_h_l101_c7_050d_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_050d
flip_x_MUX_uxn_device_h_l101_c7_050d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_050d_cond,
flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_050d_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_c8c8
BIN_OP_EQ_uxn_device_h_l104_c11_c8c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left,
BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right,
BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_be59
tmp8_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_be59_cond,
tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_be59_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_be59
ctrl_mode_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output);

-- y_MUX_uxn_device_h_l104_c7_be59
y_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_be59_cond,
y_MUX_uxn_device_h_l104_c7_be59_iftrue,
y_MUX_uxn_device_h_l104_c7_be59_iffalse,
y_MUX_uxn_device_h_l104_c7_be59_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_be59
flip_y_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_be59_cond,
flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_be59_return_output);

-- x_MUX_uxn_device_h_l104_c7_be59
x_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_be59_cond,
x_MUX_uxn_device_h_l104_c7_be59_iftrue,
x_MUX_uxn_device_h_l104_c7_be59_iffalse,
x_MUX_uxn_device_h_l104_c7_be59_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_be59
ram_addr_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_be59_cond,
ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_be59
ctrl_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_be59_cond,
ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_be59_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_be59
auto_advance_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_be59_cond,
auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output);

-- color_MUX_uxn_device_h_l104_c7_be59
color_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_be59_cond,
color_MUX_uxn_device_h_l104_c7_be59_iftrue,
color_MUX_uxn_device_h_l104_c7_be59_iffalse,
color_MUX_uxn_device_h_l104_c7_be59_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_be59
is_auto_y_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output);

-- layer_MUX_uxn_device_h_l104_c7_be59
layer_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_be59_cond,
layer_MUX_uxn_device_h_l104_c7_be59_iftrue,
layer_MUX_uxn_device_h_l104_c7_be59_iffalse,
layer_MUX_uxn_device_h_l104_c7_be59_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_be59
is_auto_x_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output);

-- result_MUX_uxn_device_h_l104_c7_be59
result_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_be59_cond,
result_MUX_uxn_device_h_l104_c7_be59_iftrue,
result_MUX_uxn_device_h_l104_c7_be59_iffalse,
result_MUX_uxn_device_h_l104_c7_be59_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_be59
flip_x_MUX_uxn_device_h_l104_c7_be59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_be59_cond,
flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_be59_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_ea8a
CONST_SR_7_uxn_device_h_l107_c25_ea8a : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_ea8a_x,
CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_e767
CONST_SR_6_uxn_device_h_l108_c21_e767 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_e767_x,
CONST_SR_6_uxn_device_h_l108_c21_e767_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_037a
CONST_SR_5_uxn_device_h_l109_c22_037a : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_037a_x,
CONST_SR_5_uxn_device_h_l109_c22_037a_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_9700
CONST_SR_4_uxn_device_h_l110_c22_9700 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_9700_x,
CONST_SR_4_uxn_device_h_l110_c22_9700_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_a37b
BIN_OP_EQ_uxn_device_h_l113_c11_a37b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left,
BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right,
BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_5d30
tmp8_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_5d30_cond,
tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- y_MUX_uxn_device_h_l113_c7_5d30
y_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_5d30_cond,
y_MUX_uxn_device_h_l113_c7_5d30_iftrue,
y_MUX_uxn_device_h_l113_c7_5d30_iffalse,
y_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- x_MUX_uxn_device_h_l113_c7_5d30
x_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_5d30_cond,
x_MUX_uxn_device_h_l113_c7_5d30_iftrue,
x_MUX_uxn_device_h_l113_c7_5d30_iffalse,
x_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_5d30
ram_addr_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond,
ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_5d30
auto_advance_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond,
auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_5d30
is_auto_y_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_5d30
is_auto_x_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- result_MUX_uxn_device_h_l113_c7_5d30
result_MUX_uxn_device_h_l113_c7_5d30 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_5d30_cond,
result_MUX_uxn_device_h_l113_c7_5d30_iftrue,
result_MUX_uxn_device_h_l113_c7_5d30_iffalse,
result_MUX_uxn_device_h_l113_c7_5d30_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_6dd6
BIN_OP_EQ_uxn_device_h_l117_c11_6dd6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left,
BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right,
BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_8cbb
tmp8_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond,
tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- y_MUX_uxn_device_h_l117_c7_8cbb
y_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_8cbb_cond,
y_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
y_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
y_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- x_MUX_uxn_device_h_l117_c7_8cbb
x_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_8cbb_cond,
x_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
x_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
x_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_8cbb
ram_addr_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond,
ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_8cbb
auto_advance_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond,
auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_8cbb
is_auto_y_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_8cbb
is_auto_x_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- result_MUX_uxn_device_h_l117_c7_8cbb
result_MUX_uxn_device_h_l117_c7_8cbb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_8cbb_cond,
result_MUX_uxn_device_h_l117_c7_8cbb_iftrue,
result_MUX_uxn_device_h_l117_c7_8cbb_iffalse,
result_MUX_uxn_device_h_l117_c7_8cbb_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_c909
tmp8_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_c909_cond,
tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_c909
result_is_vram_write_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_c909
result_u8_value_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_c909
result_is_deo_done_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_c909
result_u16_addr_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_c909
result_device_ram_address_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_0cb5
BIN_OP_AND_uxn_device_h_l121_c11_0cb5 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left,
BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right,
BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_f717
BIN_OP_PLUS_uxn_device_h_l122_c23_f717 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_177f
tmp8_MUX_uxn_device_h_l125_c4_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_177f_cond,
tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_177f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_177f
result_is_deo_done_MUX_uxn_device_h_l125_c4_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output);

-- MUX_uxn_device_h_l126_c13_b92c
MUX_uxn_device_h_l126_c13_b92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_b92c_cond,
MUX_uxn_device_h_l126_c13_b92c_iftrue,
MUX_uxn_device_h_l126_c13_b92c_iffalse,
MUX_uxn_device_h_l126_c13_b92c_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_2ad8
BIN_OP_OR_uxn_device_h_l126_c5_2ad8 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left,
BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right,
BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output);

-- MUX_uxn_device_h_l127_c13_1477
MUX_uxn_device_h_l127_c13_1477 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_1477_cond,
MUX_uxn_device_h_l127_c13_1477_iftrue,
MUX_uxn_device_h_l127_c13_1477_iffalse,
MUX_uxn_device_h_l127_c13_1477_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_2434
BIN_OP_OR_uxn_device_h_l127_c5_2434 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_2434_left,
BIN_OP_OR_uxn_device_h_l127_c5_2434_right,
BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_f3a7
BIN_OP_EQ_uxn_device_h_l136_c11_f3a7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left,
BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right,
BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output);

-- y_MUX_uxn_device_h_l136_c7_8847
y_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_8847_cond,
y_MUX_uxn_device_h_l136_c7_8847_iftrue,
y_MUX_uxn_device_h_l136_c7_8847_iffalse,
y_MUX_uxn_device_h_l136_c7_8847_return_output);

-- x_MUX_uxn_device_h_l136_c7_8847
x_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_8847_cond,
x_MUX_uxn_device_h_l136_c7_8847_iftrue,
x_MUX_uxn_device_h_l136_c7_8847_iffalse,
x_MUX_uxn_device_h_l136_c7_8847_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_8847
ram_addr_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_8847_cond,
ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_8847
auto_advance_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_8847_cond,
auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_8847
is_auto_y_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_8847
is_auto_x_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output);

-- result_MUX_uxn_device_h_l136_c7_8847
result_MUX_uxn_device_h_l136_c7_8847 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_8847_cond,
result_MUX_uxn_device_h_l136_c7_8847_iftrue,
result_MUX_uxn_device_h_l136_c7_8847_iffalse,
result_MUX_uxn_device_h_l136_c7_8847_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_6e3c
CONST_SR_1_uxn_device_h_l139_c15_6e3c : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_6e3c_x,
CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output);

-- y_MUX_uxn_device_h_l140_c3_e32f
y_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_e32f_cond,
y_MUX_uxn_device_h_l140_c3_e32f_iftrue,
y_MUX_uxn_device_h_l140_c3_e32f_iffalse,
y_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- x_MUX_uxn_device_h_l140_c3_e32f
x_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_e32f_cond,
x_MUX_uxn_device_h_l140_c3_e32f_iftrue,
x_MUX_uxn_device_h_l140_c3_e32f_iffalse,
x_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_e32f
result_u8_value_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f
result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_e32f
result_u16_addr_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f
result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f
result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output);

-- y_MUX_uxn_device_h_l144_c4_6371
y_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_6371_cond,
y_MUX_uxn_device_h_l144_c4_6371_iftrue,
y_MUX_uxn_device_h_l144_c4_6371_iffalse,
y_MUX_uxn_device_h_l144_c4_6371_return_output);

-- x_MUX_uxn_device_h_l144_c4_6371
x_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_6371_cond,
x_MUX_uxn_device_h_l144_c4_6371_iftrue,
x_MUX_uxn_device_h_l144_c4_6371_iffalse,
x_MUX_uxn_device_h_l144_c4_6371_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_6371
result_is_deo_done_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_6371
result_device_ram_address_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_6371
result_u8_value_MUX_uxn_device_h_l144_c4_6371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_5d10
BIN_OP_PLUS_uxn_device_h_l145_c5_5d10 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_ffa5
CONST_SR_8_uxn_device_h_l148_c33_ffa5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_ffa5_x,
CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output);

-- y_MUX_uxn_device_h_l149_c11_4601
y_MUX_uxn_device_h_l149_c11_4601 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_4601_cond,
y_MUX_uxn_device_h_l149_c11_4601_iftrue,
y_MUX_uxn_device_h_l149_c11_4601_iffalse,
y_MUX_uxn_device_h_l149_c11_4601_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_4601
result_is_deo_done_MUX_uxn_device_h_l149_c11_4601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_4601
result_device_ram_address_MUX_uxn_device_h_l149_c11_4601 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_4601
result_u8_value_MUX_uxn_device_h_l149_c11_4601 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_2819
BIN_OP_PLUS_uxn_device_h_l150_c5_2819 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_64ed
CONST_SR_8_uxn_device_h_l153_c33_64ed : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_64ed_x,
CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_ba24
BIN_OP_EQ_uxn_device_h_l161_c11_ba24 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left,
BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right,
BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output);

-- y_MUX_uxn_device_h_l161_c7_e3f5
y_MUX_uxn_device_h_l161_c7_e3f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_e3f5_cond,
y_MUX_uxn_device_h_l161_c7_e3f5_iftrue,
y_MUX_uxn_device_h_l161_c7_e3f5_iffalse,
y_MUX_uxn_device_h_l161_c7_e3f5_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_e3f5
ram_addr_MUX_uxn_device_h_l161_c7_e3f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond,
ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output);

-- result_MUX_uxn_device_h_l161_c7_e3f5
result_MUX_uxn_device_h_l161_c7_e3f5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_e3f5_cond,
result_MUX_uxn_device_h_l161_c7_e3f5_iftrue,
result_MUX_uxn_device_h_l161_c7_e3f5_iffalse,
result_MUX_uxn_device_h_l161_c7_e3f5_return_output);

-- y_MUX_uxn_device_h_l162_c3_d34a
y_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_d34a_cond,
y_MUX_uxn_device_h_l162_c3_d34a_iftrue,
y_MUX_uxn_device_h_l162_c3_d34a_iffalse,
y_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_d34a
ram_addr_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond,
ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a
result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a
result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_d34a
result_u8_value_MUX_uxn_device_h_l162_c3_d34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output);

-- y_MUX_uxn_device_h_l163_c4_f8f7
y_MUX_uxn_device_h_l163_c4_f8f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_f8f7_cond,
y_MUX_uxn_device_h_l163_c4_f8f7_iftrue,
y_MUX_uxn_device_h_l163_c4_f8f7_iffalse,
y_MUX_uxn_device_h_l163_c4_f8f7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7
result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7
result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_f8f7
result_u8_value_MUX_uxn_device_h_l163_c4_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_72b9
UNARY_OP_NOT_uxn_device_h_l167_c27_72b9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_d83b
BIN_OP_PLUS_uxn_device_h_l169_c5_d83b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_d683
BIN_OP_EQ_uxn_device_h_l181_c11_d683 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_d683_left,
BIN_OP_EQ_uxn_device_h_l181_c11_d683_right,
BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_4433
ram_addr_MUX_uxn_device_h_l181_c7_4433 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_4433_cond,
ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output);

-- result_MUX_uxn_device_h_l181_c7_4433
result_MUX_uxn_device_h_l181_c7_4433 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_4433_cond,
result_MUX_uxn_device_h_l181_c7_4433_iftrue,
result_MUX_uxn_device_h_l181_c7_4433_iffalse,
result_MUX_uxn_device_h_l181_c7_4433_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_1849
ram_addr_MUX_uxn_device_h_l182_c3_1849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_1849_cond,
ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_1849
result_device_ram_address_MUX_uxn_device_h_l182_c3_1849 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_1849
result_u8_value_MUX_uxn_device_h_l182_c3_1849 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_b63d
CONST_SR_8_uxn_device_h_l186_c32_b63d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_b63d_x,
CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_8ac0
BIN_OP_OR_uxn_device_h_l189_c4_8ac0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left,
BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right,
BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_b6c3
BIN_OP_EQ_uxn_device_h_l192_c11_b6c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left,
BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right,
BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output);

-- result_MUX_uxn_device_h_l192_c7_c957
result_MUX_uxn_device_h_l192_c7_c957 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_c957_cond,
result_MUX_uxn_device_h_l192_c7_c957_iftrue,
result_MUX_uxn_device_h_l192_c7_c957_iffalse,
result_MUX_uxn_device_h_l192_c7_c957_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e
result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e
result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_3e3e
result_u8_value_MUX_uxn_device_h_l193_c3_3e3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output);

-- result_MUX_uxn_device_h_l202_c3_868e
result_MUX_uxn_device_h_l202_c3_868e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_868e_cond,
result_MUX_uxn_device_h_l202_c3_868e_iftrue,
result_MUX_uxn_device_h_l202_c3_868e_iffalse,
result_MUX_uxn_device_h_l202_c3_868e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_73ca
BIN_OP_MINUS_uxn_device_h_l203_c58_73ca : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output);

-- screen_blit_uxn_device_h_l203_c46_b04a
screen_blit_uxn_device_h_l203_c46_b04a : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_b04a_phase,
screen_blit_uxn_device_h_l203_c46_b04a_ctrl,
screen_blit_uxn_device_h_l203_c46_b04a_auto_advance,
screen_blit_uxn_device_h_l203_c46_b04a_x,
screen_blit_uxn_device_h_l203_c46_b04a_y,
screen_blit_uxn_device_h_l203_c46_b04a_ram_addr,
screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_b04a_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output,
 y_MUX_uxn_device_h_l88_c2_3e14_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output,
 x_MUX_uxn_device_h_l88_c2_3e14_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output,
 color_MUX_uxn_device_h_l88_c2_3e14_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output,
 layer_MUX_uxn_device_h_l88_c2_3e14_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output,
 result_MUX_uxn_device_h_l88_c2_3e14_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output,
 MUX_uxn_device_h_l89_c19_2900_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output,
 MUX_uxn_device_h_l90_c20_307b_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output,
 MUX_uxn_device_h_l95_c32_b5c8_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_050d_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output,
 y_MUX_uxn_device_h_l101_c7_050d_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_050d_return_output,
 x_MUX_uxn_device_h_l101_c7_050d_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_050d_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output,
 color_MUX_uxn_device_h_l101_c7_050d_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output,
 layer_MUX_uxn_device_h_l101_c7_050d_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output,
 result_MUX_uxn_device_h_l101_c7_050d_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_050d_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_be59_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output,
 y_MUX_uxn_device_h_l104_c7_be59_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_be59_return_output,
 x_MUX_uxn_device_h_l104_c7_be59_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_be59_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output,
 color_MUX_uxn_device_h_l104_c7_be59_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output,
 layer_MUX_uxn_device_h_l104_c7_be59_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output,
 result_MUX_uxn_device_h_l104_c7_be59_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_be59_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_e767_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_037a_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_9700_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output,
 y_MUX_uxn_device_h_l113_c7_5d30_return_output,
 x_MUX_uxn_device_h_l113_c7_5d30_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output,
 result_MUX_uxn_device_h_l113_c7_5d30_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 y_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 x_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 result_MUX_uxn_device_h_l117_c7_8cbb_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_177f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output,
 MUX_uxn_device_h_l126_c13_b92c_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output,
 MUX_uxn_device_h_l127_c13_1477_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output,
 y_MUX_uxn_device_h_l136_c7_8847_return_output,
 x_MUX_uxn_device_h_l136_c7_8847_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output,
 result_MUX_uxn_device_h_l136_c7_8847_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output,
 y_MUX_uxn_device_h_l140_c3_e32f_return_output,
 x_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output,
 y_MUX_uxn_device_h_l144_c4_6371_return_output,
 x_MUX_uxn_device_h_l144_c4_6371_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output,
 y_MUX_uxn_device_h_l149_c11_4601_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output,
 y_MUX_uxn_device_h_l161_c7_e3f5_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output,
 result_MUX_uxn_device_h_l161_c7_e3f5_return_output,
 y_MUX_uxn_device_h_l162_c3_d34a_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output,
 y_MUX_uxn_device_h_l163_c4_f8f7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output,
 result_MUX_uxn_device_h_l181_c7_4433_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output,
 result_MUX_uxn_device_h_l192_c7_c957_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output,
 result_MUX_uxn_device_h_l202_c3_868e_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output,
 screen_blit_uxn_device_h_l203_c46_b04a_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_3e14_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_3e14_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_3e14_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_050d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_3e14_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_2900_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_2900_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_2900_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_2900_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_307b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_307b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_307b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_307b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_b5c8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_b5c8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_b5c8_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_b5c8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_050d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_050d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_050d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_be59_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_be59_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_be59_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_be59_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_5d30_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_d87a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_df01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_d463_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_95e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_98bb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_5d30_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_5d30_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_5d30_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_8cbb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_5d30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e625_uxn_device_h_l117_c7_8cbb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8847_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_8cbb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_3764 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_60f8 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_a253 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_b92c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_b92c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_b92c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_b92c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_1477_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_1477_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_1477_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_1477_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_73c8 : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_f9ef : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_e997 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_8847_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cebc_uxn_device_h_l136_c7_8847_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8847_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_e3f5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8847_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_x : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_a08b : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_d098 : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_ea25 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a4ee_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_a584 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l161_c7_e3f5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_4433_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_e3f5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_346b : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_32ad_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_825e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_4433_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_4433_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_4433_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c957_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_4433_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_e72f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_c957_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l192_c7_c957_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c957_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_868e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_c957_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_6e7d_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_868e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_868e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_868e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_868e_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_1c9a : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e697_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3660_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_490f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_7ee1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_b635_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_1aa0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_069f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output : unsigned(0 downto 0);
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
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_right := to_unsigned(1, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right := to_unsigned(8, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l127_c13_1477_iftrue := to_unsigned(4, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse := to_unsigned(44, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l90_c20_307b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_b5c8_iffalse := to_unsigned(47, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l89_c19_2900_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_1c9a := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l90_c20_307b_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l126_c13_b92c_iftrue := to_unsigned(24, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right := to_unsigned(3, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue := to_unsigned(43, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue := to_unsigned(41, 8);
     VAR_MUX_uxn_device_h_l126_c13_b92c_iffalse := to_unsigned(16, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_60f8 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_60f8;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_2900_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right := to_unsigned(9, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse := to_unsigned(45, 8);
     VAR_MUX_uxn_device_h_l127_c13_1477_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right := to_unsigned(6, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_b5c8_iftrue := to_unsigned(46, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse := to_unsigned(43, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue := to_unsigned(1, 1);
     VAR_result_u16_addr_uxn_device_h_l142_c4_a08b := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_a08b;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right := to_unsigned(2, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l143_c4_d098 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_d098;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_050d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_be59_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_3e14_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_b92c_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_1477_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_f8f7_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_e32f_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_d34a_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_868e_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_050d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_be59_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_73c8 := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_868e_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_050d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_be59_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_8847_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_e32f_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_6371_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_3e14_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_050d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_be59_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_5d30_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_e32f_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_6371_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_4601_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_d34a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_3e14_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_x := VAR_auto_advance_uxn_device_h_l137_c3_73c8;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_73c8;
     VAR_is_auto_x_uxn_device_h_l138_c3_e997 := resize(VAR_auto_advance_uxn_device_h_l137_c3_73c8, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_x_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     VAR_y_MUX_uxn_device_h_l144_c4_6371_cond := VAR_is_auto_x_uxn_device_h_l138_c3_e997;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output := result.is_deo_done;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_f8f7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_73ca] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_9700] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_9700_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_return_output := CONST_SR_4_uxn_device_h_l110_c22_9700_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_069f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_069f_return_output := result.u16_addr;

     -- MUX[uxn_device_h_l127_c13_1477] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_1477_cond <= VAR_MUX_uxn_device_h_l127_c13_1477_cond;
     MUX_uxn_device_h_l127_c13_1477_iftrue <= VAR_MUX_uxn_device_h_l127_c13_1477_iftrue;
     MUX_uxn_device_h_l127_c13_1477_iffalse <= VAR_MUX_uxn_device_h_l127_c13_1477_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_1477_return_output := MUX_uxn_device_h_l127_c13_1477_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c11_ba24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_5d10] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_1aa0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_1aa0_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l181_c11_d683] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_d683_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_d683_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_7a6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_591a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_591a_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_591a_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output := result.is_device_ram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_be59] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_be59_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l88_c6_5f78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_6e7d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_6e7d_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l101_c11_7895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_7895_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_7895_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_d87a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_d87a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_050d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_050d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l117_c11_6dd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_72b9] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output;

     -- CONST_SR_1[uxn_device_h_l139_c15_6e3c] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_6e3c_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output := CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output := result.device_ram_address;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_f8f7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_037a] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_037a_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_return_output := CONST_SR_5_uxn_device_h_l109_c22_037a_return_output;

     -- BIN_OP_AND[uxn_device_h_l121_c11_0cb5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_left;
     BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output := BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_5d30] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_5d30_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_c909] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c909_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_c8c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_2819] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_b6c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output;

     -- CONST_SR_6[uxn_device_h_l108_c21_e767] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_e767_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_return_output := CONST_SR_6_uxn_device_h_l108_c21_e767_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_d83b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_a37b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;

     -- MUX[uxn_device_h_l126_c13_b92c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_b92c_cond <= VAR_MUX_uxn_device_h_l126_c13_b92c_cond;
     MUX_uxn_device_h_l126_c13_b92c_iftrue <= VAR_MUX_uxn_device_h_l126_c13_b92c_iftrue;
     MUX_uxn_device_h_l126_c13_b92c_iffalse <= VAR_MUX_uxn_device_h_l126_c13_b92c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_b92c_return_output := MUX_uxn_device_h_l126_c13_b92c_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_32ad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_32ad_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CONST_SR_8[uxn_device_h_l186_c32_b63d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_b63d_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output := CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_f3a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;

     -- CONST_SR_7[uxn_device_h_l107_c25_ea8a] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_ea8a_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output := CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_a253 := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_0cb5_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_7895_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_be59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_c8c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_5d30_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_a37b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_8cbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_6dd6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8847_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_f3a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_e3f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_e3f5_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_ba24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_4433_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_d683_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_c957_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_b6c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_3e14_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_5f78_return_output;
     VAR_MUX_uxn_device_h_l89_c19_2900_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_591a_return_output;
     VAR_MUX_uxn_device_h_l90_c20_307b_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_7a6e_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_73ca_return_output;
     VAR_x_uxn_device_h_l145_c5_ea25 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5d10_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_a584 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_2819_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_346b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_d83b_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_5d30_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_7e51_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_d87a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_32ad_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_6e7d_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_069f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_069f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_f5d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_b632_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_1aa0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_1aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_b7df_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l193_l140_l119_l162_DUPLICATE_cd03_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_f9ef := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_6e3c_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right := VAR_MUX_uxn_device_h_l126_c13_b92c_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_right := VAR_MUX_uxn_device_h_l127_c13_1477_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_72b9_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_050d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_050d_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_be59_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_5d30_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_5d30_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_f8f7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_f8f7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c909_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_y_MUX_uxn_device_h_l149_c11_4601_cond := VAR_is_auto_y_uxn_device_h_l139_c3_f9ef;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left := VAR_tmp8_uxn_device_h_l121_c4_a253;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse := VAR_tmp8_uxn_device_h_l121_c4_a253;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_x := VAR_x_uxn_device_h_l145_c5_ea25;
     VAR_x_MUX_uxn_device_h_l144_c4_6371_iftrue := VAR_x_uxn_device_h_l145_c5_ea25;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_x := VAR_y_uxn_device_h_l150_c5_a584;
     VAR_y_MUX_uxn_device_h_l149_c11_4601_iftrue := VAR_y_uxn_device_h_l150_c5_a584;
     VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iffalse := VAR_y_uxn_device_h_l169_c5_346b;
     -- CONST_SR_8[uxn_device_h_l153_c33_64ed] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_64ed_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output := CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_95e1] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_95e1_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_037a_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_f8f7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_df01] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_df01_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea8a_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_3e3e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_8ac0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_left;
     BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output := BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_98bb] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_98bb_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_9700_return_output);

     -- MUX[uxn_device_h_l89_c19_2900] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_2900_cond <= VAR_MUX_uxn_device_h_l89_c19_2900_cond;
     MUX_uxn_device_h_l89_c19_2900_iftrue <= VAR_MUX_uxn_device_h_l89_c19_2900_iftrue;
     MUX_uxn_device_h_l89_c19_2900_iffalse <= VAR_MUX_uxn_device_h_l89_c19_2900_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_2900_return_output := MUX_uxn_device_h_l89_c19_2900_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_d463] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_d463_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e767_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_e72f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_e72f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_b63d_return_output);

     -- CONST_SR_8[uxn_device_h_l148_c33_ffa5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_ffa5_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output := CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output;

     -- y_MUX[uxn_device_h_l149_c11_4601] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_4601_cond <= VAR_y_MUX_uxn_device_h_l149_c11_4601_cond;
     y_MUX_uxn_device_h_l149_c11_4601_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_4601_iftrue;
     y_MUX_uxn_device_h_l149_c11_4601_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_4601_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_4601_return_output := y_MUX_uxn_device_h_l149_c11_4601_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_cond;
     ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_return_output := ctrl_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_825e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_825e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_346b);

     -- color_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_color_MUX_uxn_device_h_l104_c7_be59_cond;
     color_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_be59_iftrue;
     color_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_be59_return_output := color_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- y_MUX[uxn_device_h_l163_c4_f8f7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_f8f7_cond <= VAR_y_MUX_uxn_device_h_l163_c4_f8f7_cond;
     y_MUX_uxn_device_h_l163_c4_f8f7_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iftrue;
     y_MUX_uxn_device_h_l163_c4_f8f7_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_f8f7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_f8f7_return_output := y_MUX_uxn_device_h_l163_c4_f8f7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_4601] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output := auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_1849] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_4601] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_3e3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output;

     -- x_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_x_MUX_uxn_device_h_l144_c4_6371_cond;
     x_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_6371_iftrue;
     x_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_6371_return_output := x_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_177f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_3e3e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_3e3e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_4601] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output;

     -- BIN_OP_OR[uxn_device_h_l126_c5_2ad8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_left;
     BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output := BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output;

     -- MUX[uxn_device_h_l90_c20_307b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_307b_cond <= VAR_MUX_uxn_device_h_l90_c20_307b_cond;
     MUX_uxn_device_h_l90_c20_307b_iftrue <= VAR_MUX_uxn_device_h_l90_c20_307b_iftrue;
     MUX_uxn_device_h_l90_c20_307b_iffalse <= VAR_MUX_uxn_device_h_l90_c20_307b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_307b_return_output := MUX_uxn_device_h_l90_c20_307b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_1849] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_2ad8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_8ac0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_df01_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_d463_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_95e1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_98bb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_825e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_e72f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_0a71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_left := VAR_MUX_uxn_device_h_l89_c19_2900_return_output;
     VAR_MUX_uxn_device_h_l95_c32_b5c8_cond := VAR_MUX_uxn_device_h_l89_c19_2900_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue := VAR_MUX_uxn_device_h_l89_c19_2900_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_right := VAR_MUX_uxn_device_h_l90_c20_307b_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue := VAR_MUX_uxn_device_h_l90_c20_307b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_4601_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_177f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_4601_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_f8f7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_4601_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_6371_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_4601_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_d34a_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_f8f7_return_output;
     -- x_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_x_MUX_uxn_device_h_l140_c3_e32f_cond;
     x_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     x_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_e32f_return_output := x_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- BIN_OP_OR[uxn_device_h_l127_c5_2434] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_2434_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_left;
     BIN_OP_OR_uxn_device_h_l127_c5_2434_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output := BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output;

     -- result_u8_value_MUX[uxn_device_h_l163_c4_f8f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l182_c3_1849] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27[uxn_device_h_l192_c7_c957] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l192_c7_c957_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1b27(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_3e3e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_3e3e_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_3e3e_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_3e3e_return_output);

     -- y_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_y_MUX_uxn_device_h_l162_c3_d34a_cond;
     y_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     y_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_d34a_return_output := y_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_cond;
     flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_return_output := flip_y_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_cond;
     flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_return_output := flip_x_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_1af4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_64ed_return_output);

     -- is_auto_x_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_be59_cond;
     layer_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_be59_iftrue;
     layer_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_be59_return_output := layer_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_1849] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_1849_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output := ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- is_auto_y_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_a4ee] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a4ee_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ffa5_return_output);

     -- color_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_color_MUX_uxn_device_h_l101_c7_050d_cond;
     color_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_050d_iftrue;
     color_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_050d_return_output := color_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_54dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_54dc_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_left;
     BIN_OP_OR_uxn_device_h_l91_c21_54dc_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output := BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_cond;
     ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_return_output := ctrl_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_f717] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output;

     -- MUX[uxn_device_h_l95_c32_b5c8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_b5c8_cond <= VAR_MUX_uxn_device_h_l95_c32_b5c8_cond;
     MUX_uxn_device_h_l95_c32_b5c8_iftrue <= VAR_MUX_uxn_device_h_l95_c32_b5c8_iftrue;
     MUX_uxn_device_h_l95_c32_b5c8_iffalse <= VAR_MUX_uxn_device_h_l95_c32_b5c8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_b5c8_return_output := MUX_uxn_device_h_l95_c32_b5c8_return_output;

     -- ram_addr_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output := ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output := auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- y_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_y_MUX_uxn_device_h_l144_c4_6371_cond;
     y_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_6371_iftrue;
     y_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_6371_return_output := y_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_2434_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_54dc_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_3764 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_f717_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a4ee_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue := VAR_MUX_uxn_device_h_l95_c32_b5c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_d34a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_1849_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_c957_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l192_c7_c957_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_f8f7_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_e32f_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_d34a_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_3764;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l181_c7_4433] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_4433_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_1849_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_1849_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_1849_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_9743] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- y_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_y_MUX_uxn_device_h_l140_c3_e32f_cond;
     y_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     y_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_e32f_return_output := y_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_cond;
     ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output := ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- y_MUX[uxn_device_h_l161_c7_e3f5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_e3f5_cond <= VAR_y_MUX_uxn_device_h_l161_c7_e3f5_cond;
     y_MUX_uxn_device_h_l161_c7_e3f5_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iftrue;
     y_MUX_uxn_device_h_l161_c7_e3f5_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_e3f5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_e3f5_return_output := y_MUX_uxn_device_h_l161_c7_e3f5_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output := auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_cond;
     flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_return_output := flip_y_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_9743] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output;

     -- color_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_color_MUX_uxn_device_h_l88_c2_3e14_cond;
     color_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     color_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_3e14_return_output := color_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_4601] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_050d_cond;
     layer_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_050d_iftrue;
     layer_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_050d_return_output := layer_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_177f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_177f_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_cond;
     tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_return_output := tmp8_MUX_uxn_device_h_l125_c4_177f_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- ram_addr_MUX[uxn_device_h_l181_c7_4433] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_4433_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output := ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- x_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_x_MUX_uxn_device_h_l136_c7_8847_cond;
     x_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_8847_iftrue;
     x_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_8847_return_output := x_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- result_u8_value_MUX[uxn_device_h_l162_c3_d34a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_cond;
     flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_return_output := flip_x_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_5d30_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_5d30_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_5d30_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_5d30_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_4433_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_4433_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l181_c7_4433_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_4601_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_177f_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_e32f_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8847_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_e3f5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_6371] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27[uxn_device_h_l161_c7_e3f5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l161_c7_e3f5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1b27(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_d34a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_d34a_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_d34a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_d34a_return_output);

     -- flip_x_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_cond;
     flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output := flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_cond;
     flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output := flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- y_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_y_MUX_uxn_device_h_l136_c7_8847_cond;
     y_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_8847_iftrue;
     y_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_8847_return_output := y_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_c909] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_c909_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_cond;
     tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_return_output := tmp8_MUX_uxn_device_h_l119_c3_c909_return_output;

     -- is_auto_x_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output := auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_3e14_cond;
     layer_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     layer_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_3e14_return_output := layer_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l88_c2_3e14] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_3e14_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_9743_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_9743_return_output);

     -- ram_addr_MUX[uxn_device_h_l161_c7_e3f5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output := ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output;

     -- x_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_x_MUX_uxn_device_h_l117_c7_8cbb_cond;
     x_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     x_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_8cbb_return_output := x_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_be59_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_be59_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_e3f5_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l161_c7_e3f5_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_3e14_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_3e14_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_6371_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_c909_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_8847_return_output;
     -- is_auto_x_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- x_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_x_MUX_uxn_device_h_l113_c7_5d30_cond;
     x_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     x_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_5d30_return_output := x_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output := auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output := ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_u8_value_MUX[uxn_device_h_l140_c3_e32f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e625[uxn_device_h_l117_c7_8cbb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e625_uxn_device_h_l117_c7_8cbb_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e625(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c909_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c909_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c909_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c909_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c909_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c909_return_output);

     -- tmp8_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_cond;
     tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output := tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- y_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_y_MUX_uxn_device_h_l117_c7_8cbb_cond;
     y_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     y_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_8cbb_return_output := y_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_8847_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e625_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_5d30_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     -- y_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_y_MUX_uxn_device_h_l113_c7_5d30_cond;
     y_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     y_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_5d30_return_output := y_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_e3f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output := ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_cond;
     tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output := tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output := auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cebc[uxn_device_h_l136_c7_8847] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cebc_uxn_device_h_l136_c7_8847_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cebc(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_e32f_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_e32f_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_e32f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_e32f_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_e32f_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_e32f_return_output);

     -- x_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_x_MUX_uxn_device_h_l104_c7_be59_cond;
     x_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_be59_iftrue;
     x_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_be59_return_output := x_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_e3f5_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_8847_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cebc_uxn_device_h_l136_c7_8847_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_5d30_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_5d30_return_output;
     -- x_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_x_MUX_uxn_device_h_l101_c7_050d_cond;
     x_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_050d_iftrue;
     x_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_050d_return_output := x_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output := ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- y_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_y_MUX_uxn_device_h_l104_c7_be59_cond;
     y_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_be59_iftrue;
     y_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_be59_return_output := y_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_cond;
     tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_return_output := tmp8_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_4433] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_4433_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_5d30_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_050d_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_be59_return_output;
     -- tmp8_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_cond;
     tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_return_output := tmp8_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_c957] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output := ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- x_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_x_MUX_uxn_device_h_l88_c2_3e14_cond;
     x_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     x_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_3e14_return_output := x_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- y_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_y_MUX_uxn_device_h_l101_c7_050d_cond;
     y_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_050d_iftrue;
     y_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_050d_return_output := y_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_c957_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_be59_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_050d_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_050d_return_output;
     -- y_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_y_MUX_uxn_device_h_l88_c2_3e14_cond;
     y_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     y_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_3e14_return_output := y_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_cond;
     tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output := tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_1933] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output := ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1933_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_050d_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_3e14_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_3e14_return_output;
     -- ram_addr_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output := ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_7c6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7c6b_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_3e14_return_output;
     -- screen_blit[uxn_device_h_l203_c46_b04a] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_b04a_phase <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_phase;
     screen_blit_uxn_device_h_l203_c46_b04a_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_ctrl;
     screen_blit_uxn_device_h_l203_c46_b04a_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_auto_advance;
     screen_blit_uxn_device_h_l203_c46_b04a_x <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_x;
     screen_blit_uxn_device_h_l203_c46_b04a_y <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_y;
     screen_blit_uxn_device_h_l203_c46_b04a_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_ram_addr;
     screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_b04a_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output := screen_blit_uxn_device_h_l203_c46_b04a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_490f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_490f_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_e697] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e697_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_b635] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_b635_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output.is_blit_done;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_7ee1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_7ee1_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_3660] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3660_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b04a_return_output.u16_addr;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_868e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_868e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_1c9a,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_e697_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3660_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_490f_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_7ee1_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_b635_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_868e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_868e_return_output;
     -- result_MUX[uxn_device_h_l202_c3_868e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_868e_cond <= VAR_result_MUX_uxn_device_h_l202_c3_868e_cond;
     result_MUX_uxn_device_h_l202_c3_868e_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_868e_iftrue;
     result_MUX_uxn_device_h_l202_c3_868e_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_868e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_868e_return_output := result_MUX_uxn_device_h_l202_c3_868e_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_c957_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_868e_return_output;
     -- result_MUX[uxn_device_h_l192_c7_c957] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_c957_cond <= VAR_result_MUX_uxn_device_h_l192_c7_c957_cond;
     result_MUX_uxn_device_h_l192_c7_c957_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_c957_iftrue;
     result_MUX_uxn_device_h_l192_c7_c957_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_c957_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_c957_return_output := result_MUX_uxn_device_h_l192_c7_c957_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_4433_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_c957_return_output;
     -- result_MUX[uxn_device_h_l181_c7_4433] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_4433_cond <= VAR_result_MUX_uxn_device_h_l181_c7_4433_cond;
     result_MUX_uxn_device_h_l181_c7_4433_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_4433_iftrue;
     result_MUX_uxn_device_h_l181_c7_4433_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_4433_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_4433_return_output := result_MUX_uxn_device_h_l181_c7_4433_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_4433_return_output;
     -- result_MUX[uxn_device_h_l161_c7_e3f5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_e3f5_cond <= VAR_result_MUX_uxn_device_h_l161_c7_e3f5_cond;
     result_MUX_uxn_device_h_l161_c7_e3f5_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iftrue;
     result_MUX_uxn_device_h_l161_c7_e3f5_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_e3f5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_e3f5_return_output := result_MUX_uxn_device_h_l161_c7_e3f5_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_8847_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_e3f5_return_output;
     -- result_MUX[uxn_device_h_l136_c7_8847] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_8847_cond <= VAR_result_MUX_uxn_device_h_l136_c7_8847_cond;
     result_MUX_uxn_device_h_l136_c7_8847_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_8847_iftrue;
     result_MUX_uxn_device_h_l136_c7_8847_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_8847_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_8847_return_output := result_MUX_uxn_device_h_l136_c7_8847_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_8847_return_output;
     -- result_MUX[uxn_device_h_l117_c7_8cbb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_8cbb_cond <= VAR_result_MUX_uxn_device_h_l117_c7_8cbb_cond;
     result_MUX_uxn_device_h_l117_c7_8cbb_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iftrue;
     result_MUX_uxn_device_h_l117_c7_8cbb_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_8cbb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_8cbb_return_output := result_MUX_uxn_device_h_l117_c7_8cbb_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_5d30_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_8cbb_return_output;
     -- result_MUX[uxn_device_h_l113_c7_5d30] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_5d30_cond <= VAR_result_MUX_uxn_device_h_l113_c7_5d30_cond;
     result_MUX_uxn_device_h_l113_c7_5d30_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_5d30_iftrue;
     result_MUX_uxn_device_h_l113_c7_5d30_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_5d30_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_5d30_return_output := result_MUX_uxn_device_h_l113_c7_5d30_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_be59_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_5d30_return_output;
     -- result_MUX[uxn_device_h_l104_c7_be59] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_be59_cond <= VAR_result_MUX_uxn_device_h_l104_c7_be59_cond;
     result_MUX_uxn_device_h_l104_c7_be59_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_be59_iftrue;
     result_MUX_uxn_device_h_l104_c7_be59_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_be59_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_be59_return_output := result_MUX_uxn_device_h_l104_c7_be59_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_050d_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_be59_return_output;
     -- result_MUX[uxn_device_h_l101_c7_050d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_050d_cond <= VAR_result_MUX_uxn_device_h_l101_c7_050d_cond;
     result_MUX_uxn_device_h_l101_c7_050d_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_050d_iftrue;
     result_MUX_uxn_device_h_l101_c7_050d_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_050d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_050d_return_output := result_MUX_uxn_device_h_l101_c7_050d_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_3e14_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_050d_return_output;
     -- result_MUX[uxn_device_h_l88_c2_3e14] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_3e14_cond <= VAR_result_MUX_uxn_device_h_l88_c2_3e14_cond;
     result_MUX_uxn_device_h_l88_c2_3e14_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_3e14_iftrue;
     result_MUX_uxn_device_h_l88_c2_3e14_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_3e14_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_3e14_return_output := result_MUX_uxn_device_h_l88_c2_3e14_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_3e14_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_3e14_return_output;
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
