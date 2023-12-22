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
-- Submodules: 222
entity screen_deo_0CLK_8bd142e4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_8bd142e4;
architecture arch of screen_deo_0CLK_8bd142e4 is
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
-- BIN_OP_EQ[uxn_device_h_l88_c6_704f]
signal BIN_OP_EQ_uxn_device_h_l88_c6_704f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_704f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_73df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_7c46]
signal y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_7c46]
signal ctrl_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_7c46]
signal tmp8_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_7c46]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_7c46]
signal is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_7c46]
signal layer_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_7c46]
signal is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_7c46]
signal x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_7c46]
signal flip_y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_7c46]
signal auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_7c46]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_7c46]
signal ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_7c46]
signal flip_x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l88_c2_7c46]
signal result_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_7c46_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_7c46_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_7c46_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l88_c2_7c46]
signal color_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(3 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_7c46]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_7c46]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_d642]
signal BIN_OP_EQ_uxn_device_h_l89_c19_d642_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_d642_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_1ee3]
signal MUX_uxn_device_h_l89_c19_1ee3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_1ee3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_1ee3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_1ee3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_0634]
signal BIN_OP_EQ_uxn_device_h_l90_c20_0634_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_0634_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_227c]
signal MUX_uxn_device_h_l90_c20_227c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_227c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_227c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_227c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_7ce5]
signal BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_7d87]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_7d87]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l95_c32_32c3]
signal MUX_uxn_device_h_l95_c32_32c3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_32c3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_32c3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_32c3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_05d3]
signal BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_cad6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_73df]
signal y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_73df]
signal ctrl_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_73df]
signal tmp8_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_73df]
signal is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_73df]
signal layer_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_73df]
signal is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l101_c7_73df]
signal x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_73df]
signal flip_y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_73df]
signal auto_advance_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_73df]
signal ram_addr_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_73df]
signal flip_x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l101_c7_73df]
signal result_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_73df_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_73df_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_73df_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l101_c7_73df]
signal color_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(3 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_73df]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_1eb7]
signal BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_9ce6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l104_c7_cad6]
signal y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_cad6]
signal ctrl_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_cad6]
signal tmp8_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_cad6]
signal is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_cad6]
signal layer_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_cad6]
signal is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l104_c7_cad6]
signal x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_cad6]
signal flip_y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_cad6]
signal auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_cad6]
signal ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_cad6]
signal flip_x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l104_c7_cad6]
signal result_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_cad6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_cad6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_cad6_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l104_c7_cad6]
signal color_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(3 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_cad6]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_ace9]
signal CONST_SR_7_uxn_device_h_l107_c25_ace9_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_3865]
signal CONST_SR_6_uxn_device_h_l108_c21_3865_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_3865_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_f2da]
signal CONST_SR_5_uxn_device_h_l109_c22_f2da_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_7022]
signal CONST_SR_4_uxn_device_h_l110_c22_7022_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_7022_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_e727]
signal BIN_OP_EQ_uxn_device_h_l113_c11_e727_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_e727_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c7_e9fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l113_c7_9ce6]
signal y_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_9ce6]
signal tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_9ce6]
signal is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_9ce6]
signal is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l113_c7_9ce6]
signal x_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_9ce6]
signal auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_9ce6]
signal ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l113_c7_9ce6]
signal result_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_9ce6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_9ce6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_9ce6_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l118_c11_2f6f]
signal BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l122_c7_3c9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l118_c7_e9fe]
signal y_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l118_c7_e9fe]
signal tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l118_c7_e9fe]
signal is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l118_c7_e9fe]
signal is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l118_c7_e9fe]
signal x_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l118_c7_e9fe]
signal auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l118_c7_e9fe]
signal ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l118_c7_e9fe]
signal result_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l118_c7_e9fe_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l118_c7_e9fe_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l118_c7_e9fe_return_output : device_out_result_t;

-- BIN_OP_OR[uxn_device_h_l119_c3_725b]
signal BIN_OP_OR_uxn_device_h_l119_c3_725b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l119_c3_725b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c11_9120]
signal BIN_OP_EQ_uxn_device_h_l122_c11_9120_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c11_9120_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l127_c7_b6a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l122_c7_3c9d]
signal y_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l122_c7_3c9d]
signal tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l122_c7_3c9d]
signal is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l122_c7_3c9d]
signal is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l122_c7_3c9d]
signal x_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l122_c7_3c9d]
signal auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l122_c7_3c9d]
signal ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l122_c7_3c9d]
signal result_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l122_c7_3c9d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l122_c7_3c9d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l122_c7_3c9d_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l127_c11_2658]
signal BIN_OP_EQ_uxn_device_h_l127_c11_2658_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l127_c11_2658_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l148_c7_2400]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l127_c7_b6a5]
signal y_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l127_c7_b6a5]
signal tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l127_c7_b6a5]
signal is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l127_c7_b6a5]
signal is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l127_c7_b6a5]
signal x_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l127_c7_b6a5]
signal auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l127_c7_b6a5]
signal ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l127_c7_b6a5]
signal result_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l127_c7_b6a5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l127_c7_b6a5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l127_c7_b6a5_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l128_c3_83f1]
signal y_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l128_c3_83f1]
signal tmp8_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l128_c3_83f1]
signal result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l128_c3_83f1]
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l128_c3_83f1]
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l128_c3_83f1]
signal result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l128_c3_83f1]
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l128_c3_83f1]
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l131_c11_607e]
signal BIN_OP_AND_uxn_device_h_l131_c11_607e_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l131_c11_607e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output : unsigned(3 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c23_d1d2]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l132_c23_3e03]
signal BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output : unsigned(32 downto 0);

-- tmp8_MUX[uxn_device_h_l135_c4_0d01]
signal tmp8_MUX_uxn_device_h_l135_c4_0d01_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c4_0d01]
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l136_c13_fb4f]
signal MUX_uxn_device_h_l136_c13_fb4f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l136_c13_fb4f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l136_c13_fb4f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l136_c13_fb4f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l136_c5_f8a1]
signal BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l137_c13_1f58]
signal MUX_uxn_device_h_l137_c13_1f58_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l137_c13_1f58_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c13_1f58_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c13_1f58_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l137_c5_a944]
signal BIN_OP_OR_uxn_device_h_l137_c5_a944_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l137_c5_a944_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c11_ec8e]
signal BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l175_c7_dcfb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l148_c7_2400]
signal y_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l148_c7_2400]
signal is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l148_c7_2400]
signal is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l148_c7_2400]
signal x_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l148_c7_2400]
signal auto_advance_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l148_c7_2400]
signal ram_addr_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l148_c7_2400]
signal result_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l148_c7_2400_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l148_c7_2400_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l148_c7_2400_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l149_c3_7392]
signal y_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l149_c3_7392]
signal is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l149_c3_7392]
signal is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l149_c3_7392]
signal x_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l149_c3_7392]
signal auto_advance_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l149_c3_7392]
signal result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l149_c3_7392]
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c3_7392]
signal result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c3_7392]
signal result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c3_7392]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c3_7392]
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);

-- CONST_SR_1[uxn_device_h_l152_c16_b607]
signal CONST_SR_1_uxn_device_h_l152_c16_b607_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l152_c16_b607_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l156_c4_c927]
signal y_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l156_c4_c927]
signal x_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l156_c4_c927]
signal result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l156_c4_c927]
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l156_c4_c927]
signal result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l156_c4_c927]
signal result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c5_21d8]
signal BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l160_c33_e510]
signal CONST_SR_8_uxn_device_h_l160_c33_e510_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l160_c33_e510_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l161_c11_f53b]
signal y_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c11_f53b]
signal result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l161_c11_f53b]
signal result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c11_f53b]
signal result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l161_c11_f53b]
signal result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l162_c5_3bf1]
signal BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l165_c33_dc21]
signal CONST_SR_8_uxn_device_h_l165_c33_dc21_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l175_c11_96ee]
signal BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_d7f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l175_c7_dcfb]
signal y_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l175_c7_dcfb]
signal ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l175_c7_dcfb]
signal result_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l175_c7_dcfb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l175_c7_dcfb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l175_c7_dcfb_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l176_c3_9905]
signal y_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l176_c3_9905]
signal ram_addr_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l176_c3_9905]
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l176_c3_9905]
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l176_c3_9905]
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l176_c3_9905]
signal result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l177_c4_732b]
signal y_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l177_c4_732b]
signal result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l177_c4_732b]
signal result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l177_c4_732b]
signal result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l177_c4_732b]
signal result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l181_c27_2359]
signal UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l183_c5_b37a]
signal BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_45b1]
signal BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l206_c7_bc70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l195_c7_d7f6]
signal ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l195_c7_d7f6]
signal result_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_d7f6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_d7f6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_d7f6_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l196_c3_9685]
signal ram_addr_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_9685]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_9685]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_9685]
signal result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l200_c32_2aef]
signal CONST_SR_8_uxn_device_h_l200_c32_2aef_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l203_c4_0e86]
signal BIN_OP_OR_uxn_device_h_l203_c4_0e86_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l203_c4_0e86_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l206_c11_e8e6]
signal BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l215_c1_06dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l206_c7_bc70]
signal result_MUX_uxn_device_h_l206_c7_bc70_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l206_c7_bc70_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l206_c7_bc70_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l206_c7_bc70_return_output : device_out_result_t;

-- result_is_deo_done_MUX[uxn_device_h_l207_c3_a97b]
signal result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l207_c3_a97b]
signal result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l207_c3_a97b]
signal result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l207_c3_a97b]
signal result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l216_c1_8f28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l216_c3_fcc1]
signal result_MUX_uxn_device_h_l216_c3_fcc1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l216_c3_fcc1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l216_c3_fcc1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l216_c3_fcc1_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l217_c58_9943]
signal BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l217_c46_1d35]
signal screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l217_c46_1d35_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd
signal CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_59d1( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.device_ram_address := ref_toks_6;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_0159( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.device_ram_address := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_704f
BIN_OP_EQ_uxn_device_h_l88_c6_704f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_704f_left,
BIN_OP_EQ_uxn_device_h_l88_c6_704f_right,
BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output);

-- y_MUX_uxn_device_h_l88_c2_7c46
y_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_7c46_cond,
y_MUX_uxn_device_h_l88_c2_7c46_iftrue,
y_MUX_uxn_device_h_l88_c2_7c46_iffalse,
y_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_7c46
ctrl_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_7c46_cond,
ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_7c46
tmp8_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_7c46_cond,
tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_7c46
is_pixel_port_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_7c46
is_auto_y_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- layer_MUX_uxn_device_h_l88_c2_7c46
layer_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_7c46_cond,
layer_MUX_uxn_device_h_l88_c2_7c46_iftrue,
layer_MUX_uxn_device_h_l88_c2_7c46_iffalse,
layer_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_7c46
is_auto_x_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- x_MUX_uxn_device_h_l88_c2_7c46
x_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_7c46_cond,
x_MUX_uxn_device_h_l88_c2_7c46_iftrue,
x_MUX_uxn_device_h_l88_c2_7c46_iffalse,
x_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_7c46
flip_y_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_7c46_cond,
flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_7c46
auto_advance_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond,
auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_7c46
is_sprite_port_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_7c46
ram_addr_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond,
ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_7c46
flip_x_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_7c46_cond,
flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- result_MUX_uxn_device_h_l88_c2_7c46
result_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_7c46_cond,
result_MUX_uxn_device_h_l88_c2_7c46_iftrue,
result_MUX_uxn_device_h_l88_c2_7c46_iffalse,
result_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- color_MUX_uxn_device_h_l88_c2_7c46
color_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_7c46_cond,
color_MUX_uxn_device_h_l88_c2_7c46_iftrue,
color_MUX_uxn_device_h_l88_c2_7c46_iffalse,
color_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_7c46
is_drawing_port_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_7c46
ctrl_mode_MUX_uxn_device_h_l88_c2_7c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_d642
BIN_OP_EQ_uxn_device_h_l89_c19_d642 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_d642_left,
BIN_OP_EQ_uxn_device_h_l89_c19_d642_right,
BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output);

-- MUX_uxn_device_h_l89_c19_1ee3
MUX_uxn_device_h_l89_c19_1ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_1ee3_cond,
MUX_uxn_device_h_l89_c19_1ee3_iftrue,
MUX_uxn_device_h_l89_c19_1ee3_iffalse,
MUX_uxn_device_h_l89_c19_1ee3_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_0634
BIN_OP_EQ_uxn_device_h_l90_c20_0634 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_0634_left,
BIN_OP_EQ_uxn_device_h_l90_c20_0634_right,
BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output);

-- MUX_uxn_device_h_l90_c20_227c
MUX_uxn_device_h_l90_c20_227c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_227c_cond,
MUX_uxn_device_h_l90_c20_227c_iftrue,
MUX_uxn_device_h_l90_c20_227c_iffalse,
MUX_uxn_device_h_l90_c20_227c_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_7ce5
BIN_OP_OR_uxn_device_h_l91_c21_7ce5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left,
BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right,
BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87
result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87
result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output);

-- MUX_uxn_device_h_l95_c32_32c3
MUX_uxn_device_h_l95_c32_32c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_32c3_cond,
MUX_uxn_device_h_l95_c32_32c3_iftrue,
MUX_uxn_device_h_l95_c32_32c3_iffalse,
MUX_uxn_device_h_l95_c32_32c3_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_05d3
BIN_OP_EQ_uxn_device_h_l101_c11_05d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left,
BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right,
BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- y_MUX_uxn_device_h_l101_c7_73df
y_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_73df_cond,
y_MUX_uxn_device_h_l101_c7_73df_iftrue,
y_MUX_uxn_device_h_l101_c7_73df_iffalse,
y_MUX_uxn_device_h_l101_c7_73df_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_73df
ctrl_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_73df_cond,
ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_73df_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_73df
tmp8_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_73df_cond,
tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_73df_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_73df
is_auto_y_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output);

-- layer_MUX_uxn_device_h_l101_c7_73df
layer_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_73df_cond,
layer_MUX_uxn_device_h_l101_c7_73df_iftrue,
layer_MUX_uxn_device_h_l101_c7_73df_iffalse,
layer_MUX_uxn_device_h_l101_c7_73df_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_73df
is_auto_x_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output);

-- x_MUX_uxn_device_h_l101_c7_73df
x_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_73df_cond,
x_MUX_uxn_device_h_l101_c7_73df_iftrue,
x_MUX_uxn_device_h_l101_c7_73df_iffalse,
x_MUX_uxn_device_h_l101_c7_73df_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_73df
flip_y_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_73df_cond,
flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_73df_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_73df
auto_advance_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_73df_cond,
auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_73df
ram_addr_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_73df_cond,
ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_73df
flip_x_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_73df_cond,
flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_73df_return_output);

-- result_MUX_uxn_device_h_l101_c7_73df
result_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_73df_cond,
result_MUX_uxn_device_h_l101_c7_73df_iftrue,
result_MUX_uxn_device_h_l101_c7_73df_iffalse,
result_MUX_uxn_device_h_l101_c7_73df_return_output);

-- color_MUX_uxn_device_h_l101_c7_73df
color_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_73df_cond,
color_MUX_uxn_device_h_l101_c7_73df_iftrue,
color_MUX_uxn_device_h_l101_c7_73df_iffalse,
color_MUX_uxn_device_h_l101_c7_73df_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_73df
ctrl_mode_MUX_uxn_device_h_l101_c7_73df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_1eb7
BIN_OP_EQ_uxn_device_h_l104_c11_1eb7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left,
BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right,
BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- y_MUX_uxn_device_h_l104_c7_cad6
y_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_cad6_cond,
y_MUX_uxn_device_h_l104_c7_cad6_iftrue,
y_MUX_uxn_device_h_l104_c7_cad6_iffalse,
y_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_cad6
ctrl_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_cad6_cond,
ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_cad6
tmp8_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_cad6_cond,
tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_cad6
is_auto_y_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- layer_MUX_uxn_device_h_l104_c7_cad6
layer_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_cad6_cond,
layer_MUX_uxn_device_h_l104_c7_cad6_iftrue,
layer_MUX_uxn_device_h_l104_c7_cad6_iffalse,
layer_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_cad6
is_auto_x_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- x_MUX_uxn_device_h_l104_c7_cad6
x_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_cad6_cond,
x_MUX_uxn_device_h_l104_c7_cad6_iftrue,
x_MUX_uxn_device_h_l104_c7_cad6_iffalse,
x_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_cad6
flip_y_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_cad6_cond,
flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_cad6
auto_advance_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond,
auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_cad6
ram_addr_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond,
ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_cad6
flip_x_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_cad6_cond,
flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- result_MUX_uxn_device_h_l104_c7_cad6
result_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_cad6_cond,
result_MUX_uxn_device_h_l104_c7_cad6_iftrue,
result_MUX_uxn_device_h_l104_c7_cad6_iffalse,
result_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- color_MUX_uxn_device_h_l104_c7_cad6
color_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_cad6_cond,
color_MUX_uxn_device_h_l104_c7_cad6_iftrue,
color_MUX_uxn_device_h_l104_c7_cad6_iffalse,
color_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_cad6
ctrl_mode_MUX_uxn_device_h_l104_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_ace9
CONST_SR_7_uxn_device_h_l107_c25_ace9 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_ace9_x,
CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_3865
CONST_SR_6_uxn_device_h_l108_c21_3865 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_3865_x,
CONST_SR_6_uxn_device_h_l108_c21_3865_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_f2da
CONST_SR_5_uxn_device_h_l109_c22_f2da : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_f2da_x,
CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_7022
CONST_SR_4_uxn_device_h_l110_c22_7022 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_7022_x,
CONST_SR_4_uxn_device_h_l110_c22_7022_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_e727
BIN_OP_EQ_uxn_device_h_l113_c11_e727 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_e727_left,
BIN_OP_EQ_uxn_device_h_l113_c11_e727_right,
BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- y_MUX_uxn_device_h_l113_c7_9ce6
y_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_9ce6_cond,
y_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
y_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
y_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_9ce6
tmp8_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond,
tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_9ce6
is_auto_y_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_9ce6
is_auto_x_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- x_MUX_uxn_device_h_l113_c7_9ce6
x_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_9ce6_cond,
x_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
x_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
x_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_9ce6
auto_advance_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond,
auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_9ce6
ram_addr_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond,
ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- result_MUX_uxn_device_h_l113_c7_9ce6
result_MUX_uxn_device_h_l113_c7_9ce6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_9ce6_cond,
result_MUX_uxn_device_h_l113_c7_9ce6_iftrue,
result_MUX_uxn_device_h_l113_c7_9ce6_iffalse,
result_MUX_uxn_device_h_l113_c7_9ce6_return_output);

-- BIN_OP_EQ_uxn_device_h_l118_c11_2f6f
BIN_OP_EQ_uxn_device_h_l118_c11_2f6f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left,
BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right,
BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- y_MUX_uxn_device_h_l118_c7_e9fe
y_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l118_c7_e9fe_cond,
y_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
y_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
y_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- tmp8_MUX_uxn_device_h_l118_c7_e9fe
tmp8_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond,
tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- is_auto_y_MUX_uxn_device_h_l118_c7_e9fe
is_auto_y_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond,
is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- is_auto_x_MUX_uxn_device_h_l118_c7_e9fe
is_auto_x_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond,
is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- x_MUX_uxn_device_h_l118_c7_e9fe
x_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l118_c7_e9fe_cond,
x_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
x_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
x_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- auto_advance_MUX_uxn_device_h_l118_c7_e9fe
auto_advance_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond,
auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- ram_addr_MUX_uxn_device_h_l118_c7_e9fe
ram_addr_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond,
ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- result_MUX_uxn_device_h_l118_c7_e9fe
result_MUX_uxn_device_h_l118_c7_e9fe : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l118_c7_e9fe_cond,
result_MUX_uxn_device_h_l118_c7_e9fe_iftrue,
result_MUX_uxn_device_h_l118_c7_e9fe_iffalse,
result_MUX_uxn_device_h_l118_c7_e9fe_return_output);

-- BIN_OP_OR_uxn_device_h_l119_c3_725b
BIN_OP_OR_uxn_device_h_l119_c3_725b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l119_c3_725b_left,
BIN_OP_OR_uxn_device_h_l119_c3_725b_right,
BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c11_9120
BIN_OP_EQ_uxn_device_h_l122_c11_9120 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c11_9120_left,
BIN_OP_EQ_uxn_device_h_l122_c11_9120_right,
BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- y_MUX_uxn_device_h_l122_c7_3c9d
y_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c7_3c9d_cond,
y_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
y_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
y_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- tmp8_MUX_uxn_device_h_l122_c7_3c9d
tmp8_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond,
tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- is_auto_y_MUX_uxn_device_h_l122_c7_3c9d
is_auto_y_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond,
is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- is_auto_x_MUX_uxn_device_h_l122_c7_3c9d
is_auto_x_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond,
is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- x_MUX_uxn_device_h_l122_c7_3c9d
x_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l122_c7_3c9d_cond,
x_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
x_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
x_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- auto_advance_MUX_uxn_device_h_l122_c7_3c9d
auto_advance_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond,
auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- ram_addr_MUX_uxn_device_h_l122_c7_3c9d
ram_addr_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond,
ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- result_MUX_uxn_device_h_l122_c7_3c9d
result_MUX_uxn_device_h_l122_c7_3c9d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l122_c7_3c9d_cond,
result_MUX_uxn_device_h_l122_c7_3c9d_iftrue,
result_MUX_uxn_device_h_l122_c7_3c9d_iffalse,
result_MUX_uxn_device_h_l122_c7_3c9d_return_output);

-- BIN_OP_EQ_uxn_device_h_l127_c11_2658
BIN_OP_EQ_uxn_device_h_l127_c11_2658 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l127_c11_2658_left,
BIN_OP_EQ_uxn_device_h_l127_c11_2658_right,
BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output);

-- y_MUX_uxn_device_h_l127_c7_b6a5
y_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l127_c7_b6a5_cond,
y_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
y_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
y_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- tmp8_MUX_uxn_device_h_l127_c7_b6a5
tmp8_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond,
tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- is_auto_y_MUX_uxn_device_h_l127_c7_b6a5
is_auto_y_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond,
is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- is_auto_x_MUX_uxn_device_h_l127_c7_b6a5
is_auto_x_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond,
is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- x_MUX_uxn_device_h_l127_c7_b6a5
x_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l127_c7_b6a5_cond,
x_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
x_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
x_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- auto_advance_MUX_uxn_device_h_l127_c7_b6a5
auto_advance_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond,
auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- ram_addr_MUX_uxn_device_h_l127_c7_b6a5
ram_addr_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond,
ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- result_MUX_uxn_device_h_l127_c7_b6a5
result_MUX_uxn_device_h_l127_c7_b6a5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l127_c7_b6a5_cond,
result_MUX_uxn_device_h_l127_c7_b6a5_iftrue,
result_MUX_uxn_device_h_l127_c7_b6a5_iffalse,
result_MUX_uxn_device_h_l127_c7_b6a5_return_output);

-- y_MUX_uxn_device_h_l128_c3_83f1
y_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l128_c3_83f1_cond,
y_MUX_uxn_device_h_l128_c3_83f1_iftrue,
y_MUX_uxn_device_h_l128_c3_83f1_iffalse,
y_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- tmp8_MUX_uxn_device_h_l128_c3_83f1
tmp8_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l128_c3_83f1_cond,
tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue,
tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse,
tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_u16_addr_MUX_uxn_device_h_l128_c3_83f1
result_u16_addr_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond,
result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1
result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1
result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond,
result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_u8_value_MUX_uxn_device_h_l128_c3_83f1
result_u8_value_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond,
result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1
result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond,
result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1
result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond,
result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output);

-- BIN_OP_AND_uxn_device_h_l131_c11_607e
BIN_OP_AND_uxn_device_h_l131_c11_607e : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l131_c11_607e_left,
BIN_OP_AND_uxn_device_h_l131_c11_607e_right,
BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l132_c23_3e03
BIN_OP_PLUS_uxn_device_h_l132_c23_3e03 : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left,
BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right,
BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output);

-- tmp8_MUX_uxn_device_h_l135_c4_0d01
tmp8_MUX_uxn_device_h_l135_c4_0d01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l135_c4_0d01_cond,
tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue,
tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse,
tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01
result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output);

-- MUX_uxn_device_h_l136_c13_fb4f
MUX_uxn_device_h_l136_c13_fb4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l136_c13_fb4f_cond,
MUX_uxn_device_h_l136_c13_fb4f_iftrue,
MUX_uxn_device_h_l136_c13_fb4f_iffalse,
MUX_uxn_device_h_l136_c13_fb4f_return_output);

-- BIN_OP_OR_uxn_device_h_l136_c5_f8a1
BIN_OP_OR_uxn_device_h_l136_c5_f8a1 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left,
BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right,
BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output);

-- MUX_uxn_device_h_l137_c13_1f58
MUX_uxn_device_h_l137_c13_1f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l137_c13_1f58_cond,
MUX_uxn_device_h_l137_c13_1f58_iftrue,
MUX_uxn_device_h_l137_c13_1f58_iffalse,
MUX_uxn_device_h_l137_c13_1f58_return_output);

-- BIN_OP_OR_uxn_device_h_l137_c5_a944
BIN_OP_OR_uxn_device_h_l137_c5_a944 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l137_c5_a944_left,
BIN_OP_OR_uxn_device_h_l137_c5_a944_right,
BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c11_ec8e
BIN_OP_EQ_uxn_device_h_l148_c11_ec8e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left,
BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right,
BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output);

-- y_MUX_uxn_device_h_l148_c7_2400
y_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l148_c7_2400_cond,
y_MUX_uxn_device_h_l148_c7_2400_iftrue,
y_MUX_uxn_device_h_l148_c7_2400_iffalse,
y_MUX_uxn_device_h_l148_c7_2400_return_output);

-- is_auto_y_MUX_uxn_device_h_l148_c7_2400
is_auto_y_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond,
is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue,
is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse,
is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output);

-- is_auto_x_MUX_uxn_device_h_l148_c7_2400
is_auto_x_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond,
is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue,
is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse,
is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output);

-- x_MUX_uxn_device_h_l148_c7_2400
x_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l148_c7_2400_cond,
x_MUX_uxn_device_h_l148_c7_2400_iftrue,
x_MUX_uxn_device_h_l148_c7_2400_iffalse,
x_MUX_uxn_device_h_l148_c7_2400_return_output);

-- auto_advance_MUX_uxn_device_h_l148_c7_2400
auto_advance_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l148_c7_2400_cond,
auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue,
auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse,
auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output);

-- ram_addr_MUX_uxn_device_h_l148_c7_2400
ram_addr_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l148_c7_2400_cond,
ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue,
ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse,
ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output);

-- result_MUX_uxn_device_h_l148_c7_2400
result_MUX_uxn_device_h_l148_c7_2400 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l148_c7_2400_cond,
result_MUX_uxn_device_h_l148_c7_2400_iftrue,
result_MUX_uxn_device_h_l148_c7_2400_iffalse,
result_MUX_uxn_device_h_l148_c7_2400_return_output);

-- y_MUX_uxn_device_h_l149_c3_7392
y_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c3_7392_cond,
y_MUX_uxn_device_h_l149_c3_7392_iftrue,
y_MUX_uxn_device_h_l149_c3_7392_iffalse,
y_MUX_uxn_device_h_l149_c3_7392_return_output);

-- is_auto_y_MUX_uxn_device_h_l149_c3_7392
is_auto_y_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond,
is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue,
is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse,
is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output);

-- is_auto_x_MUX_uxn_device_h_l149_c3_7392
is_auto_x_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond,
is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue,
is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse,
is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output);

-- x_MUX_uxn_device_h_l149_c3_7392
x_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l149_c3_7392_cond,
x_MUX_uxn_device_h_l149_c3_7392_iftrue,
x_MUX_uxn_device_h_l149_c3_7392_iffalse,
x_MUX_uxn_device_h_l149_c3_7392_return_output);

-- auto_advance_MUX_uxn_device_h_l149_c3_7392
auto_advance_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l149_c3_7392_cond,
auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue,
auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse,
auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_u16_addr_MUX_uxn_device_h_l149_c3_7392
result_u16_addr_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond,
result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l149_c3_7392
result_is_vram_write_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond,
result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c3_7392
result_u8_value_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond,
result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c3_7392
result_is_deo_done_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c3_7392
result_device_ram_address_MUX_uxn_device_h_l149_c3_7392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output);

-- CONST_SR_1_uxn_device_h_l152_c16_b607
CONST_SR_1_uxn_device_h_l152_c16_b607 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l152_c16_b607_x,
CONST_SR_1_uxn_device_h_l152_c16_b607_return_output);

-- y_MUX_uxn_device_h_l156_c4_c927
y_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l156_c4_c927_cond,
y_MUX_uxn_device_h_l156_c4_c927_iftrue,
y_MUX_uxn_device_h_l156_c4_c927_iffalse,
y_MUX_uxn_device_h_l156_c4_c927_return_output);

-- x_MUX_uxn_device_h_l156_c4_c927
x_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l156_c4_c927_cond,
x_MUX_uxn_device_h_l156_c4_c927_iftrue,
x_MUX_uxn_device_h_l156_c4_c927_iffalse,
x_MUX_uxn_device_h_l156_c4_c927_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l156_c4_c927
result_is_deo_done_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond,
result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue,
result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse,
result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927
result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond,
result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l156_c4_c927
result_device_ram_address_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond,
result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue,
result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse,
result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output);

-- result_u8_value_MUX_uxn_device_h_l156_c4_c927
result_u8_value_MUX_uxn_device_h_l156_c4_c927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond,
result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue,
result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse,
result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c5_21d8
BIN_OP_PLUS_uxn_device_h_l157_c5_21d8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left,
BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right,
BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output);

-- CONST_SR_8_uxn_device_h_l160_c33_e510
CONST_SR_8_uxn_device_h_l160_c33_e510 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l160_c33_e510_x,
CONST_SR_8_uxn_device_h_l160_c33_e510_return_output);

-- y_MUX_uxn_device_h_l161_c11_f53b
y_MUX_uxn_device_h_l161_c11_f53b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c11_f53b_cond,
y_MUX_uxn_device_h_l161_c11_f53b_iftrue,
y_MUX_uxn_device_h_l161_c11_f53b_iffalse,
y_MUX_uxn_device_h_l161_c11_f53b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b
result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b
result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b
result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output);

-- result_u8_value_MUX_uxn_device_h_l161_c11_f53b
result_u8_value_MUX_uxn_device_h_l161_c11_f53b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond,
result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue,
result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse,
result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1
BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left,
BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right,
BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output);

-- CONST_SR_8_uxn_device_h_l165_c33_dc21
CONST_SR_8_uxn_device_h_l165_c33_dc21 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l165_c33_dc21_x,
CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output);

-- BIN_OP_EQ_uxn_device_h_l175_c11_96ee
BIN_OP_EQ_uxn_device_h_l175_c11_96ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left,
BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right,
BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output);

-- y_MUX_uxn_device_h_l175_c7_dcfb
y_MUX_uxn_device_h_l175_c7_dcfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l175_c7_dcfb_cond,
y_MUX_uxn_device_h_l175_c7_dcfb_iftrue,
y_MUX_uxn_device_h_l175_c7_dcfb_iffalse,
y_MUX_uxn_device_h_l175_c7_dcfb_return_output);

-- ram_addr_MUX_uxn_device_h_l175_c7_dcfb
ram_addr_MUX_uxn_device_h_l175_c7_dcfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond,
ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue,
ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse,
ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output);

-- result_MUX_uxn_device_h_l175_c7_dcfb
result_MUX_uxn_device_h_l175_c7_dcfb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l175_c7_dcfb_cond,
result_MUX_uxn_device_h_l175_c7_dcfb_iftrue,
result_MUX_uxn_device_h_l175_c7_dcfb_iffalse,
result_MUX_uxn_device_h_l175_c7_dcfb_return_output);

-- y_MUX_uxn_device_h_l176_c3_9905
y_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l176_c3_9905_cond,
y_MUX_uxn_device_h_l176_c3_9905_iftrue,
y_MUX_uxn_device_h_l176_c3_9905_iffalse,
y_MUX_uxn_device_h_l176_c3_9905_return_output);

-- ram_addr_MUX_uxn_device_h_l176_c3_9905
ram_addr_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l176_c3_9905_cond,
ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue,
ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse,
ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l176_c3_9905
result_is_deo_done_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond,
result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue,
result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse,
result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l176_c3_9905
result_device_ram_address_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond,
result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue,
result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse,
result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output);

-- result_u8_value_MUX_uxn_device_h_l176_c3_9905
result_u8_value_MUX_uxn_device_h_l176_c3_9905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond,
result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue,
result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse,
result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output);

-- y_MUX_uxn_device_h_l177_c4_732b
y_MUX_uxn_device_h_l177_c4_732b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c4_732b_cond,
y_MUX_uxn_device_h_l177_c4_732b_iftrue,
y_MUX_uxn_device_h_l177_c4_732b_iffalse,
y_MUX_uxn_device_h_l177_c4_732b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l177_c4_732b
result_is_deo_done_MUX_uxn_device_h_l177_c4_732b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond,
result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b
result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l177_c4_732b
result_device_ram_address_MUX_uxn_device_h_l177_c4_732b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond,
result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output);

-- result_u8_value_MUX_uxn_device_h_l177_c4_732b
result_u8_value_MUX_uxn_device_h_l177_c4_732b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond,
result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue,
result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse,
result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output);

-- UNARY_OP_NOT_uxn_device_h_l181_c27_2359
UNARY_OP_NOT_uxn_device_h_l181_c27_2359 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr,
UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output);

-- BIN_OP_PLUS_uxn_device_h_l183_c5_b37a
BIN_OP_PLUS_uxn_device_h_l183_c5_b37a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left,
BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right,
BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_45b1
BIN_OP_EQ_uxn_device_h_l195_c11_45b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left,
BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right,
BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_d7f6
ram_addr_MUX_uxn_device_h_l195_c7_d7f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond,
ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output);

-- result_MUX_uxn_device_h_l195_c7_d7f6
result_MUX_uxn_device_h_l195_c7_d7f6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_d7f6_cond,
result_MUX_uxn_device_h_l195_c7_d7f6_iftrue,
result_MUX_uxn_device_h_l195_c7_d7f6_iffalse,
result_MUX_uxn_device_h_l195_c7_d7f6_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_9685
ram_addr_MUX_uxn_device_h_l196_c3_9685 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_9685_cond,
ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_9685
result_device_ram_address_MUX_uxn_device_h_l196_c3_9685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_9685
result_u8_value_MUX_uxn_device_h_l196_c3_9685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output);

-- CONST_SR_8_uxn_device_h_l200_c32_2aef
CONST_SR_8_uxn_device_h_l200_c32_2aef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l200_c32_2aef_x,
CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output);

-- BIN_OP_OR_uxn_device_h_l203_c4_0e86
BIN_OP_OR_uxn_device_h_l203_c4_0e86 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l203_c4_0e86_left,
BIN_OP_OR_uxn_device_h_l203_c4_0e86_right,
BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output);

-- BIN_OP_EQ_uxn_device_h_l206_c11_e8e6
BIN_OP_EQ_uxn_device_h_l206_c11_e8e6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left,
BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right,
BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output);

-- result_MUX_uxn_device_h_l206_c7_bc70
result_MUX_uxn_device_h_l206_c7_bc70 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l206_c7_bc70_cond,
result_MUX_uxn_device_h_l206_c7_bc70_iftrue,
result_MUX_uxn_device_h_l206_c7_bc70_iffalse,
result_MUX_uxn_device_h_l206_c7_bc70_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b
result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond,
result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b
result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b
result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond,
result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output);

-- result_u8_value_MUX_uxn_device_h_l207_c3_a97b
result_u8_value_MUX_uxn_device_h_l207_c3_a97b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond,
result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue,
result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse,
result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output);

-- result_MUX_uxn_device_h_l216_c3_fcc1
result_MUX_uxn_device_h_l216_c3_fcc1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l216_c3_fcc1_cond,
result_MUX_uxn_device_h_l216_c3_fcc1_iftrue,
result_MUX_uxn_device_h_l216_c3_fcc1_iffalse,
result_MUX_uxn_device_h_l216_c3_fcc1_return_output);

-- BIN_OP_MINUS_uxn_device_h_l217_c58_9943
BIN_OP_MINUS_uxn_device_h_l217_c58_9943 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left,
BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right,
BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output);

-- screen_blit_uxn_device_h_l217_c46_1d35
screen_blit_uxn_device_h_l217_c46_1d35 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE,
screen_blit_uxn_device_h_l217_c46_1d35_phase,
screen_blit_uxn_device_h_l217_c46_1d35_ctrl,
screen_blit_uxn_device_h_l217_c46_1d35_auto_advance,
screen_blit_uxn_device_h_l217_c46_1d35_x,
screen_blit_uxn_device_h_l217_c46_1d35_y,
screen_blit_uxn_device_h_l217_c46_1d35_ram_addr,
screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read,
screen_blit_uxn_device_h_l217_c46_1d35_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd
CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x,
CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output,
 y_MUX_uxn_device_h_l88_c2_7c46_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output,
 layer_MUX_uxn_device_h_l88_c2_7c46_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output,
 x_MUX_uxn_device_h_l88_c2_7c46_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output,
 result_MUX_uxn_device_h_l88_c2_7c46_return_output,
 color_MUX_uxn_device_h_l88_c2_7c46_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output,
 MUX_uxn_device_h_l89_c19_1ee3_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output,
 MUX_uxn_device_h_l90_c20_227c_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output,
 MUX_uxn_device_h_l95_c32_32c3_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output,
 y_MUX_uxn_device_h_l101_c7_73df_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_73df_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_73df_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output,
 layer_MUX_uxn_device_h_l101_c7_73df_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output,
 x_MUX_uxn_device_h_l101_c7_73df_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_73df_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_73df_return_output,
 result_MUX_uxn_device_h_l101_c7_73df_return_output,
 color_MUX_uxn_device_h_l101_c7_73df_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 y_MUX_uxn_device_h_l104_c7_cad6_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output,
 layer_MUX_uxn_device_h_l104_c7_cad6_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output,
 x_MUX_uxn_device_h_l104_c7_cad6_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output,
 result_MUX_uxn_device_h_l104_c7_cad6_return_output,
 color_MUX_uxn_device_h_l104_c7_cad6_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_3865_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_7022_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 y_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 x_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 result_MUX_uxn_device_h_l113_c7_9ce6_return_output,
 BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 y_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 x_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 result_MUX_uxn_device_h_l118_c7_e9fe_return_output,
 BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 y_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 x_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 result_MUX_uxn_device_h_l122_c7_3c9d_return_output,
 BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output,
 y_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 x_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 result_MUX_uxn_device_h_l127_c7_b6a5_return_output,
 y_MUX_uxn_device_h_l128_c3_83f1_return_output,
 tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output,
 BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output,
 BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output,
 tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output,
 MUX_uxn_device_h_l136_c13_fb4f_return_output,
 BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output,
 MUX_uxn_device_h_l137_c13_1f58_return_output,
 BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output,
 y_MUX_uxn_device_h_l148_c7_2400_return_output,
 is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output,
 is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output,
 x_MUX_uxn_device_h_l148_c7_2400_return_output,
 auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output,
 ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output,
 result_MUX_uxn_device_h_l148_c7_2400_return_output,
 y_MUX_uxn_device_h_l149_c3_7392_return_output,
 is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output,
 is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output,
 x_MUX_uxn_device_h_l149_c3_7392_return_output,
 auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output,
 CONST_SR_1_uxn_device_h_l152_c16_b607_return_output,
 y_MUX_uxn_device_h_l156_c4_c927_return_output,
 x_MUX_uxn_device_h_l156_c4_c927_return_output,
 result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output,
 result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output,
 result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output,
 CONST_SR_8_uxn_device_h_l160_c33_e510_return_output,
 y_MUX_uxn_device_h_l161_c11_f53b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output,
 result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output,
 BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output,
 CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output,
 BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output,
 y_MUX_uxn_device_h_l175_c7_dcfb_return_output,
 ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output,
 result_MUX_uxn_device_h_l175_c7_dcfb_return_output,
 y_MUX_uxn_device_h_l176_c3_9905_return_output,
 ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output,
 result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output,
 result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output,
 result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output,
 y_MUX_uxn_device_h_l177_c4_732b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output,
 result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output,
 UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output,
 BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output,
 result_MUX_uxn_device_h_l195_c7_d7f6_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output,
 CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output,
 BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output,
 BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output,
 result_MUX_uxn_device_h_l206_c7_bc70_return_output,
 result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output,
 result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output,
 result_MUX_uxn_device_h_l216_c3_fcc1_return_output,
 BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output,
 screen_blit_uxn_device_h_l217_c46_1d35_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_7c46_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_7c46_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7c46_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_73df_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7c46_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_1ee3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_1ee3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_1ee3_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_1ee3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_227c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_227c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_227c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_227c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_32c3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_32c3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_32c3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_32c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_73df_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_73df_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_73df_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_cad6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_cad6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_cad6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_cad6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_9ce6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_1522_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_0422_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_1efe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_7ce5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cb23_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_9ce6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_e9fe_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_e9fe_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_3c9d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l118_c7_e9fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_3c9d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_b6a5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l122_c7_3c9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_59d1_uxn_device_h_l127_c7_b6a5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_2400_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l127_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l132_c4_71a5 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_e834 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l131_c4_75d3 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output : unsigned(32 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fb4f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fb4f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fb4f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l136_c13_fb4f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_1f58_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_1f58_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_1f58_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c13_1f58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l148_c7_2400_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0159_uxn_device_h_l148_c7_2400_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_2400_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c7_dcfb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l148_c7_2400_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l152_c4_d6df : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l151_c4_8a55 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l150_c4_1d2f : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l154_c4_859c : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_x : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l155_c4_4068 : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l157_c5_4834 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l160_c23_630b_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l162_c5_95b0 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l165_c23_527a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l175_c7_dcfb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_d7f6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c7_dcfb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l183_c5_ccbf : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l180_c23_d6bf_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c23_73f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_d7f6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c7_bc70_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_d7f6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c22_4ecc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l206_c7_bc70_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l206_c7_bc70_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c7_bc70_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c3_fcc1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l206_c7_bc70_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l211_c22_df6b_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l216_c3_fcc1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l216_c3_fcc1_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l219_c4_bdd1 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l220_c27_8858_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l221_c22_c5c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l222_c30_53ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l223_c22_9780_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l224_c25_bc7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_b4c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_38fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l90_c20_227c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right := to_unsigned(9, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right := to_unsigned(4, 8);
     VAR_result_u8_value_uxn_device_h_l155_c4_4068 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse := VAR_result_u8_value_uxn_device_h_l155_c4_4068;
     VAR_MUX_uxn_device_h_l95_c32_32c3_iffalse := to_unsigned(47, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l136_c13_fb4f_iftrue := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue := to_unsigned(40, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse := to_unsigned(43, 8);
     VAR_MUX_uxn_device_h_l90_c20_227c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_1ee3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_32c3_iftrue := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_e834 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_e834;
     VAR_MUX_uxn_device_h_l89_c19_1ee3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right := to_unsigned(10, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue := to_unsigned(42, 8);
     VAR_result_u16_addr_uxn_device_h_l154_c4_859c := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_result_u16_addr_uxn_device_h_l154_c4_859c;
     VAR_MUX_uxn_device_h_l137_c13_1f58_iftrue := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l219_c4_bdd1 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l137_c13_1f58_iffalse := to_unsigned(0, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right := to_unsigned(1, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse := to_unsigned(45, 8);
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l136_c13_fb4f_iffalse := to_unsigned(16, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right := to_unsigned(11, 8);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right := to_unsigned(260, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_right := to_unsigned(15, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_right := to_unsigned(0, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_73df_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_cad6_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_7c46_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l136_c13_fb4f_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l137_c13_1f58_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l177_c4_732b_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l128_c3_83f1_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l149_c3_7392_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l176_c3_9905_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l216_c3_fcc1_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_73df_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l150_c4_1d2f := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue := tmp8;
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left := x;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_73df_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_cad6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue := x;
     VAR_x_MUX_uxn_device_h_l148_c7_2400_iffalse := x;
     VAR_x_MUX_uxn_device_h_l149_c3_7392_iffalse := x;
     VAR_x_MUX_uxn_device_h_l156_c4_c927_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_7c46_iftrue := x;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left := y;
     VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_x := y;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_73df_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_cad6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c3_7392_iffalse := y;
     VAR_y_MUX_uxn_device_h_l156_c4_c927_iftrue := y;
     VAR_y_MUX_uxn_device_h_l161_c11_f53b_iffalse := y;
     VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iffalse := y;
     VAR_y_MUX_uxn_device_h_l176_c3_9905_iffalse := y;
     VAR_y_MUX_uxn_device_h_l177_c4_732b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_7c46_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_x := VAR_auto_advance_uxn_device_h_l150_c4_1d2f;
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_auto_advance_uxn_device_h_l150_c4_1d2f;
     VAR_is_auto_x_uxn_device_h_l151_c4_8a55 := resize(VAR_auto_advance_uxn_device_h_l150_c4_1d2f, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_x_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     VAR_y_MUX_uxn_device_h_l156_c4_c927_cond := VAR_is_auto_x_uxn_device_h_l151_c4_8a55;
     -- CONST_SR_6[uxn_device_h_l108_c21_3865] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_3865_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_return_output := CONST_SR_6_uxn_device_h_l108_c21_3865_return_output;

     -- BIN_OP_EQ[uxn_device_h_l175_c11_96ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_left;
     BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output := BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_0634] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_0634_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_0634_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l180_c23_d6bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l180_c23_d6bf_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- result_device_ram_address_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output := result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c11_9120] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c11_9120_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_left;
     BIN_OP_EQ_uxn_device_h_l122_c11_9120_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output := BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;

     -- CONST_SR_8[uxn_device_h_l200_c32_2aef] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l200_c32_2aef_x <= VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output := CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l217_c58_9943] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left <= VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_left;
     BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right <= VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output := BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_1eb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_9ce6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_9ce6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output := result.is_deo_done;

     -- CONST_SR_1[uxn_device_h_l152_c16_b607] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l152_c16_b607_x <= VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_return_output := CONST_SR_1_uxn_device_h_l152_c16_b607_return_output;

     -- MUX[uxn_device_h_l136_c13_fb4f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l136_c13_fb4f_cond <= VAR_MUX_uxn_device_h_l136_c13_fb4f_cond;
     MUX_uxn_device_h_l136_c13_fb4f_iftrue <= VAR_MUX_uxn_device_h_l136_c13_fb4f_iftrue;
     MUX_uxn_device_h_l136_c13_fb4f_iffalse <= VAR_MUX_uxn_device_h_l136_c13_fb4f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l136_c13_fb4f_return_output := MUX_uxn_device_h_l136_c13_fb4f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l148_c11_ec8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_left;
     BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output := BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l181_c27_2359] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output := UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l162_c5_3bf1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_left;
     BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output := BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_38fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_38fe_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l127_c11_2658] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l127_c11_2658_left <= VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_left;
     BIN_OP_EQ_uxn_device_h_l127_c11_2658_right <= VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output := BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_73df] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_73df_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(40, 8));

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_05d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_e727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_e727_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_e727_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_1522] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_1522_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l206_c11_e8e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left <= VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_left;
     BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right <= VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output := BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output;

     -- CONST_SR_7[uxn_device_h_l107_c25_ace9] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_ace9_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output := CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l183_c5_b37a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_left;
     BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output := BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_45b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c5_21d8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_left;
     BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output := BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l118_c11_2f6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_left;
     BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output := BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;

     -- BIN_OP_AND[uxn_device_h_l131_c11_607e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l131_c11_607e_left <= VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_left;
     BIN_OP_AND_uxn_device_h_l131_c11_607e_right <= VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output := BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_7022] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_7022_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_return_output := CONST_SR_4_uxn_device_h_l110_c22_7022_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l128_c3_83f1] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_83f1_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_704f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_704f_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_704f_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;

     -- is_auto_x_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_cond;
     is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iftrue;
     is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output := is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_d642] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_d642_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_d642_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l122_c7_3c9d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_3c9d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- CONST_SR_5[uxn_device_h_l109_c22_f2da] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_f2da_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output := CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l177_c4_732b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_cond;
     result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output := result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output;

     -- auto_advance_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_cond;
     auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iftrue;
     auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output := auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l211_c22_df6b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l211_c22_df6b_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_cad6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_cad6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output := result.is_device_ram_write;

     -- MUX[uxn_device_h_l137_c13_1f58] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l137_c13_1f58_cond <= VAR_MUX_uxn_device_h_l137_c13_1f58_cond;
     MUX_uxn_device_h_l137_c13_1f58_iftrue <= VAR_MUX_uxn_device_h_l137_c13_1f58_iftrue;
     MUX_uxn_device_h_l137_c13_1f58_iffalse <= VAR_MUX_uxn_device_h_l137_c13_1f58_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l137_c13_1f58_return_output := MUX_uxn_device_h_l137_c13_1f58_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_b4c7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_b4c7_return_output := result.u16_addr;

     -- result_is_device_ram_write_MUX[uxn_device_h_l177_c4_732b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l118_c7_e9fe] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_e9fe_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l131_c4_75d3 := resize(VAR_BIN_OP_AND_uxn_device_h_l131_c11_607e_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_05d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_1eb7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_e727_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_result_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_y_MUX_uxn_device_h_l118_c7_e9fe_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_2f6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_result_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_x_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_3c9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c11_9120_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_result_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_x_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_y_MUX_uxn_device_h_l127_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l127_c11_2658_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_result_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_x_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_y_MUX_uxn_device_h_l148_c7_2400_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c11_ec8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output;
     VAR_result_MUX_uxn_device_h_l175_c7_dcfb_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output;
     VAR_y_MUX_uxn_device_h_l175_c7_dcfb_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_96ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_d7f6_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_45b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output;
     VAR_result_MUX_uxn_device_h_l206_c7_bc70_cond := VAR_BIN_OP_EQ_uxn_device_h_l206_c11_e8e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_7c46_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_704f_return_output;
     VAR_MUX_uxn_device_h_l89_c19_1ee3_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_d642_return_output;
     VAR_MUX_uxn_device_h_l90_c20_227c_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_0634_return_output;
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_phase := VAR_BIN_OP_MINUS_uxn_device_h_l217_c58_9943_return_output;
     VAR_x_uxn_device_h_l157_c5_4834 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c5_21d8_return_output, 16);
     VAR_y_uxn_device_h_l162_c5_95b0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l162_c5_3bf1_return_output, 16);
     VAR_y_uxn_device_h_l183_c5_ccbf := resize(VAR_BIN_OP_PLUS_uxn_device_h_l183_c5_b37a_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l114_l119_l203_l130_l191_l144_l123_DUPLICATE_0e36_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_1522_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l180_c23_d6bf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l211_c22_df6b_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_b4c7_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l128_l149_DUPLICATE_b4c7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l161_l149_l207_l156_l135_l176_l128_DUPLICATE_a0c8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l161_l207_l149_l176_l196_DUPLICATE_69d9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_38fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l128_l149_DUPLICATE_38fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l161_l207_l176_l94_l196_DUPLICATE_fd1b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l207_l149_l176_l128_l196_DUPLICATE_40c0_return_output;
     VAR_is_auto_y_uxn_device_h_l152_c4_d6df := resize(VAR_CONST_SR_1_uxn_device_h_l152_c16_b607_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right := VAR_MUX_uxn_device_h_l136_c13_fb4f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_right := VAR_MUX_uxn_device_h_l137_c13_1f58_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l181_c27_2359_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_auto_advance_MUX_uxn_device_h_l149_c3_7392_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_is_auto_x_MUX_uxn_device_h_l149_c3_7392_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_73df_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_73df_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_cad6_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l177_c4_732b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l177_c4_732b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l128_c3_83f1_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_y_MUX_uxn_device_h_l161_c11_f53b_cond := VAR_is_auto_y_uxn_device_h_l152_c4_d6df;
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left := VAR_tmp8_uxn_device_h_l131_c4_75d3;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse := VAR_tmp8_uxn_device_h_l131_c4_75d3;
     VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_x := VAR_x_uxn_device_h_l157_c5_4834;
     VAR_x_MUX_uxn_device_h_l156_c4_c927_iftrue := VAR_x_uxn_device_h_l157_c5_4834;
     VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_x := VAR_y_uxn_device_h_l162_c5_95b0;
     VAR_y_MUX_uxn_device_h_l161_c11_f53b_iftrue := VAR_y_uxn_device_h_l162_c5_95b0;
     VAR_y_MUX_uxn_device_h_l177_c4_732b_iffalse := VAR_y_uxn_device_h_l183_c5_ccbf;
     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_7ce5] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_7ce5_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_f2da_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_cond;
     result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output := result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- BIN_OP_OR[uxn_device_h_l136_c5_f8a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_left;
     BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output := BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c11_f53b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l161_c11_f53b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output;

     -- color_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_color_MUX_uxn_device_h_l104_c7_cad6_cond;
     color_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     color_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_cad6_return_output := color_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l186_c23_73f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c23_73f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l183_c5_ccbf);

     -- CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output := CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output;

     -- auto_advance_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_cond;
     auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iftrue;
     auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output := auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_cond;
     ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output := ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- is_auto_y_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_cond;
     is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iftrue;
     is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output := is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output := result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l177_c4_732b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_cond;
     result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output := result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output;

     -- MUX[uxn_device_h_l90_c20_227c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_227c_cond <= VAR_MUX_uxn_device_h_l90_c20_227c_cond;
     MUX_uxn_device_h_l90_c20_227c_iftrue <= VAR_MUX_uxn_device_h_l90_c20_227c_iftrue;
     MUX_uxn_device_h_l90_c20_227c_iffalse <= VAR_MUX_uxn_device_h_l90_c20_227c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_227c_return_output := MUX_uxn_device_h_l90_c20_227c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- y_MUX[uxn_device_h_l177_c4_732b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c4_732b_cond <= VAR_y_MUX_uxn_device_h_l177_c4_732b_cond;
     y_MUX_uxn_device_h_l177_c4_732b_iftrue <= VAR_y_MUX_uxn_device_h_l177_c4_732b_iftrue;
     y_MUX_uxn_device_h_l177_c4_732b_iffalse <= VAR_y_MUX_uxn_device_h_l177_c4_732b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c4_732b_return_output := y_MUX_uxn_device_h_l177_c4_732b_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_1efe] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_1efe_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_3865_return_output);

     -- y_MUX[uxn_device_h_l161_c11_f53b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c11_f53b_cond <= VAR_y_MUX_uxn_device_h_l161_c11_f53b_cond;
     y_MUX_uxn_device_h_l161_c11_f53b_iftrue <= VAR_y_MUX_uxn_device_h_l161_c11_f53b_iftrue;
     y_MUX_uxn_device_h_l161_c11_f53b_iffalse <= VAR_y_MUX_uxn_device_h_l161_c11_f53b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c11_f53b_return_output := y_MUX_uxn_device_h_l161_c11_f53b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c11_f53b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output := result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- CONST_SR_8[uxn_device_h_l165_c33_dc21] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l165_c33_dc21_x <= VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output := CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_9685] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_cb23] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cb23_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_7022_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l200_c22_4ecc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c22_4ecc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l200_c32_2aef_return_output);

     -- BIN_OP_OR[uxn_device_h_l119_c3_725b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l119_c3_725b_left <= VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_left;
     BIN_OP_OR_uxn_device_h_l119_c3_725b_right <= VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output := BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_cond;
     result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output := result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l207_c3_a97b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output := result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- CONST_SR_8[uxn_device_h_l160_c33_e510] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l160_c33_e510_x <= VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_return_output := CONST_SR_8_uxn_device_h_l160_c33_e510_return_output;

     -- is_auto_x_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_cond;
     is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iftrue;
     is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output := is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- x_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_x_MUX_uxn_device_h_l156_c4_c927_cond;
     x_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_x_MUX_uxn_device_h_l156_c4_c927_iftrue;
     x_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_x_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l156_c4_c927_return_output := x_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_9685] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output;

     -- BIN_OP_OR[uxn_device_h_l203_c4_0e86] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l203_c4_0e86_left <= VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_left;
     BIN_OP_OR_uxn_device_h_l203_c4_0e86_right <= VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output := BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_0422] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_0422_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ace9_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_cond;
     result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output := result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- MUX[uxn_device_h_l89_c19_1ee3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_1ee3_cond <= VAR_MUX_uxn_device_h_l89_c19_1ee3_cond;
     MUX_uxn_device_h_l89_c19_1ee3_iftrue <= VAR_MUX_uxn_device_h_l89_c19_1ee3_iftrue;
     MUX_uxn_device_h_l89_c19_1ee3_iffalse <= VAR_MUX_uxn_device_h_l89_c19_1ee3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_1ee3_return_output := MUX_uxn_device_h_l89_c19_1ee3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c4_0d01] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output;

     -- result_u8_value_MUX[uxn_device_h_l207_c3_a97b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_cond;
     result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iftrue;
     result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output := result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l207_c3_a97b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_cond;
     result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output := result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l207_c3_a97b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_cond;
     result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output := result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output;

     -- Submodule level 2
     VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue := VAR_BIN_OP_OR_uxn_device_h_l119_c3_725b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_left := VAR_BIN_OP_OR_uxn_device_h_l136_c5_f8a1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse := VAR_BIN_OP_OR_uxn_device_h_l203_c4_0e86_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output;
     VAR_y_MUX_uxn_device_h_l128_c3_83f1_iffalse := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output;
     VAR_y_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l130_l144_DUPLICATE_2af8_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_0422_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_1efe_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_7ce5_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_cb23_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c23_73f5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c22_4ecc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l192_l124_l115_DUPLICATE_cddd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left := VAR_MUX_uxn_device_h_l89_c19_1ee3_return_output;
     VAR_MUX_uxn_device_h_l95_c32_32c3_cond := VAR_MUX_uxn_device_h_l89_c19_1ee3_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue := VAR_MUX_uxn_device_h_l89_c19_1ee3_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right := VAR_MUX_uxn_device_h_l90_c20_227c_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue := VAR_MUX_uxn_device_h_l90_c20_227c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l148_c7_2400_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l148_c7_2400_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_is_auto_y_MUX_uxn_device_h_l149_c3_7392_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c11_f53b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c4_0d01_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c11_f53b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l177_c4_732b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l161_c11_f53b_return_output;
     VAR_x_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_x_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_y_MUX_uxn_device_h_l156_c4_c927_iffalse := VAR_y_MUX_uxn_device_h_l161_c11_f53b_return_output;
     VAR_y_MUX_uxn_device_h_l176_c3_9905_iftrue := VAR_y_MUX_uxn_device_h_l177_c4_732b_return_output;
     -- y_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_y_MUX_uxn_device_h_l176_c3_9905_cond;
     y_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_y_MUX_uxn_device_h_l176_c3_9905_iftrue;
     y_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_y_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l176_c3_9905_return_output := y_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l165_c23_527a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l165_c23_527a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l165_c33_dc21_return_output);

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c23_d1d2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_7ce5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_left;
     BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output := BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_cond;
     result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output := result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- result_u8_value_MUX[uxn_device_h_l177_c4_732b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_cond;
     result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iftrue;
     result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output := result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output;

     -- color_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_color_MUX_uxn_device_h_l101_c7_73df_cond;
     color_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_73df_iftrue;
     color_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_73df_return_output := color_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output := result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_cond;
     result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output := result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_cond;
     flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output := flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- auto_advance_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_cond;
     auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output := auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- MUX[uxn_device_h_l95_c32_32c3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_32c3_cond <= VAR_MUX_uxn_device_h_l95_c32_32c3_cond;
     MUX_uxn_device_h_l95_c32_32c3_iftrue <= VAR_MUX_uxn_device_h_l95_c32_32c3_iftrue;
     MUX_uxn_device_h_l95_c32_32c3_iffalse <= VAR_MUX_uxn_device_h_l95_c32_32c3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_32c3_return_output := MUX_uxn_device_h_l95_c32_32c3_return_output;

     -- is_auto_x_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_cond;
     is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output := is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- y_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_y_MUX_uxn_device_h_l128_c3_83f1_cond;
     y_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_y_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     y_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_y_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l128_c3_83f1_return_output := y_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- y_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_y_MUX_uxn_device_h_l156_c4_c927_cond;
     y_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_y_MUX_uxn_device_h_l156_c4_c927_iftrue;
     y_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_y_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l156_c4_c927_return_output := y_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output := result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_cond;
     result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output := result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27[uxn_device_h_l206_c7_bc70] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l206_c7_bc70_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1b27(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l207_c3_a97b_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l207_c3_a97b_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l207_c3_a97b_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l207_c3_a97b_return_output);

     -- x_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_x_MUX_uxn_device_h_l149_c3_7392_cond;
     x_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_x_MUX_uxn_device_h_l149_c3_7392_iftrue;
     x_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_x_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l149_c3_7392_return_output := x_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_cond;
     ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_return_output := ctrl_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_9685] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_9685_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output := ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output;

     -- is_auto_y_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_cond;
     is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iftrue;
     is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output := is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l160_c23_630b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l160_c23_630b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l160_c33_e510_return_output);

     -- flip_x_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_cond;
     flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output := flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c3_9685] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- BIN_OP_OR[uxn_device_h_l137_c5_a944] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l137_c5_a944_left <= VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_left;
     BIN_OP_OR_uxn_device_h_l137_c5_a944_right <= VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output := BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_cad6_cond;
     layer_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     layer_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_cad6_return_output := layer_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- ram_addr_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_cond;
     ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iftrue;
     ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output := ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c23_d1d2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue := VAR_BIN_OP_OR_uxn_device_h_l137_c5_a944_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_7ce5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l160_c23_630b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l165_c23_527a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue := VAR_MUX_uxn_device_h_l95_c32_32c3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l148_c7_2400_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue := VAR_ram_addr_MUX_uxn_device_h_l176_c3_9905_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_9685_return_output;
     VAR_result_MUX_uxn_device_h_l206_c7_bc70_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l206_c7_bc70_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l177_c4_732b_return_output;
     VAR_x_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_x_MUX_uxn_device_h_l149_c3_7392_return_output;
     VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue := VAR_y_MUX_uxn_device_h_l128_c3_83f1_return_output;
     VAR_y_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_y_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iftrue := VAR_y_MUX_uxn_device_h_l176_c3_9905_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_7d87] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output;

     -- tmp8_MUX[uxn_device_h_l135_c4_0d01] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l135_c4_0d01_cond <= VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_cond;
     tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue <= VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iftrue;
     tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse <= VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output := tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output;

     -- auto_advance_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_cond;
     auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output := auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_cond;
     is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output := is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_cond;
     ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output := ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- color_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_color_MUX_uxn_device_h_l88_c2_7c46_cond;
     color_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     color_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_7c46_return_output := color_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l195_c7_d7f6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_d7f6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_9685_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_9685_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_9685_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_cond;
     flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_return_output := flip_y_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_7d87] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output;

     -- result_u8_value_MUX[uxn_device_h_l161_c11_f53b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_cond;
     result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iftrue;
     result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output := result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output;

     -- is_auto_x_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_cond;
     is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output := is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_d7f6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output := ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l132_c23_3e03] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_left;
     BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output := BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output;

     -- result_u8_value_MUX[uxn_device_h_l176_c3_9905] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond <= VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_cond;
     result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iftrue;
     result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output := result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- x_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_x_MUX_uxn_device_h_l148_c7_2400_cond;
     x_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_x_MUX_uxn_device_h_l148_c7_2400_iftrue;
     x_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_x_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l148_c7_2400_return_output := x_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_cond;
     flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_return_output := flip_x_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- y_MUX[uxn_device_h_l175_c7_dcfb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l175_c7_dcfb_cond <= VAR_y_MUX_uxn_device_h_l175_c7_dcfb_cond;
     y_MUX_uxn_device_h_l175_c7_dcfb_iftrue <= VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iftrue;
     y_MUX_uxn_device_h_l175_c7_dcfb_iffalse <= VAR_y_MUX_uxn_device_h_l175_c7_dcfb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l175_c7_dcfb_return_output := y_MUX_uxn_device_h_l175_c7_dcfb_return_output;

     -- y_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_y_MUX_uxn_device_h_l149_c3_7392_cond;
     y_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_y_MUX_uxn_device_h_l149_c3_7392_iftrue;
     y_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_y_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c3_7392_return_output := y_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_73df_cond;
     layer_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_73df_iftrue;
     layer_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_73df_return_output := layer_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- Submodule level 4
     VAR_result_u16_addr_uxn_device_h_l132_c4_71a5 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l132_c23_3e03_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_auto_advance_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_d7f6_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_d7f6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l161_c11_f53b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output;
     VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_tmp8_MUX_uxn_device_h_l135_c4_0d01_return_output;
     VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_x_MUX_uxn_device_h_l148_c7_2400_return_output;
     VAR_y_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_y_MUX_uxn_device_h_l149_c3_7392_return_output;
     VAR_y_MUX_uxn_device_h_l148_c7_2400_iffalse := VAR_y_MUX_uxn_device_h_l175_c7_dcfb_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue := VAR_result_u16_addr_uxn_device_h_l132_c4_71a5;
     -- result_u16_addr_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output := result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_cond;
     flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output := flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- is_auto_x_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_cond;
     is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output := is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- tmp8_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_cond;
     tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output := tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_7c46_cond;
     layer_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     layer_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_7c46_return_output := layer_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l88_c2_7c46] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_7c46_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_7d87_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_7d87_return_output);

     -- result_u8_value_MUX[uxn_device_h_l128_c3_83f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_cond;
     result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iftrue;
     result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output := result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output;

     -- auto_advance_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_cond;
     auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output := auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- result_u8_value_MUX[uxn_device_h_l156_c4_c927] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond <= VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_cond;
     result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iftrue;
     result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output := result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_cond;
     flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output := flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27[uxn_device_h_l175_c7_dcfb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l175_c7_dcfb_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1b27(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_9905_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_9905_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_9905_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l176_c3_9905_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- y_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_y_MUX_uxn_device_h_l148_c7_2400_cond;
     y_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_y_MUX_uxn_device_h_l148_c7_2400_iftrue;
     y_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_y_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l148_c7_2400_return_output := y_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- x_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_x_MUX_uxn_device_h_l127_c7_b6a5_cond;
     x_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     x_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_x_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l127_c7_b6a5_return_output := x_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- ram_addr_MUX[uxn_device_h_l175_c7_dcfb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond <= VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_cond;
     ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iftrue;
     ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output := ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output;

     -- is_auto_y_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_cond;
     is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output := is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse := VAR_ram_addr_MUX_uxn_device_h_l175_c7_dcfb_return_output;
     VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b27_uxn_device_h_l175_c7_dcfb_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_7c46_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_7c46_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l156_c4_c927_return_output;
     VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue := VAR_tmp8_MUX_uxn_device_h_l128_c3_83f1_return_output;
     VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_x_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_y_MUX_uxn_device_h_l148_c7_2400_return_output;
     -- is_auto_x_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c3_7392] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_cond;
     result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output := result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- ram_addr_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_cond;
     ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iftrue;
     ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output := ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- y_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_y_MUX_uxn_device_h_l127_c7_b6a5_cond;
     y_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     y_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_y_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l127_c7_b6a5_return_output := y_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- tmp8_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_cond;
     tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output := tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_59d1[uxn_device_h_l127_c7_b6a5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_59d1_uxn_device_h_l127_c7_b6a5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_59d1(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l128_c3_83f1_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l128_c3_83f1_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l128_c3_83f1_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l128_c3_83f1_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l128_c3_83f1_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l128_c3_83f1_return_output);

     -- is_auto_y_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_cond;
     is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output := is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- x_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_x_MUX_uxn_device_h_l122_c7_3c9d_cond;
     x_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     x_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_x_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l122_c7_3c9d_return_output := x_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output := auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l148_c7_2400_return_output;
     VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_59d1_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_tmp8_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_x_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_y_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     -- y_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_y_MUX_uxn_device_h_l122_c7_3c9d_cond;
     y_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     y_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_y_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c7_3c9d_return_output := y_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0159[uxn_device_h_l148_c7_2400] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0159_uxn_device_h_l148_c7_2400_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_0159(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l149_c3_7392_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c3_7392_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l149_c3_7392_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c3_7392_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c3_7392_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c3_7392_return_output);

     -- auto_advance_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output := auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- x_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_x_MUX_uxn_device_h_l118_c7_e9fe_cond;
     x_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     x_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_x_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l118_c7_e9fe_return_output := x_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- ram_addr_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_cond;
     ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output := ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- tmp8_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_cond;
     tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output := tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- is_auto_x_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     VAR_result_MUX_uxn_device_h_l148_c7_2400_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0159_uxn_device_h_l148_c7_2400_return_output;
     VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_tmp8_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_x_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_y_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     -- tmp8_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_cond;
     tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output := tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- x_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_x_MUX_uxn_device_h_l113_c7_9ce6_cond;
     x_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     x_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_9ce6_return_output := x_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- y_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_y_MUX_uxn_device_h_l118_c7_e9fe_cond;
     y_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     y_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_y_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l118_c7_e9fe_return_output := y_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- is_auto_x_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- ram_addr_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_cond;
     ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output := ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output := auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l148_c7_2400_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_ram_addr_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_tmp8_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_y_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     -- ram_addr_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_cond;
     ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output := ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_cond;
     tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output := tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l175_c7_dcfb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output;

     -- x_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_x_MUX_uxn_device_h_l104_c7_cad6_cond;
     x_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     x_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_cad6_return_output := x_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output := auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- y_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_y_MUX_uxn_device_h_l113_c7_9ce6_cond;
     y_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     y_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_9ce6_return_output := y_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_dcfb_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     -- tmp8_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_cond;
     tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output := tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_d7f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output;

     -- x_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_x_MUX_uxn_device_h_l101_c7_73df_cond;
     x_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_73df_iftrue;
     x_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_73df_return_output := x_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- y_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_y_MUX_uxn_device_h_l104_c7_cad6_cond;
     y_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     y_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_cad6_return_output := y_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output := ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_d7f6_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_73df_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_cad6_return_output;
     -- tmp8_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_cond;
     tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_return_output := tmp8_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- x_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_x_MUX_uxn_device_h_l88_c2_7c46_cond;
     x_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     x_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_7c46_return_output := x_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l206_c7_bc70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output := ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- y_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_y_MUX_uxn_device_h_l101_c7_73df_cond;
     y_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_73df_iftrue;
     y_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_73df_return_output := y_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l206_c7_bc70_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_cad6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_73df_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_73df_return_output;
     -- y_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_y_MUX_uxn_device_h_l88_c2_7c46_cond;
     y_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     y_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_7c46_return_output := y_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l215_c1_06dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_cond;
     tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output := tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output := ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- Submodule level 12
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l215_c1_06dc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_73df_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_7c46_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_7c46_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l216_c1_8f28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output;

     -- ram_addr_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output := ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- Submodule level 13
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l216_c1_8f28_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_7c46_return_output;
     -- screen_blit[uxn_device_h_l217_c46_1d35] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l217_c46_1d35_phase <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_phase;
     screen_blit_uxn_device_h_l217_c46_1d35_ctrl <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_ctrl;
     screen_blit_uxn_device_h_l217_c46_1d35_auto_advance <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_auto_advance;
     screen_blit_uxn_device_h_l217_c46_1d35_x <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_x;
     screen_blit_uxn_device_h_l217_c46_1d35_y <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_y;
     screen_blit_uxn_device_h_l217_c46_1d35_ram_addr <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_ram_addr;
     screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read <= VAR_screen_blit_uxn_device_h_l217_c46_1d35_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output := screen_blit_uxn_device_h_l217_c46_1d35_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l222_c30_53ea] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l222_c30_53ea_return_output := VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l223_c22_9780] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l223_c22_9780_return_output := VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l224_c25_bc7e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l224_c25_bc7e_return_output := VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output.is_blit_done;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l221_c22_c5c2] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l221_c22_c5c2_return_output := VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l220_c27_8858] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l220_c27_8858_return_output := VAR_screen_blit_uxn_device_h_l217_c46_1d35_return_output.is_vram_write;

     -- Submodule level 15
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l216_c3_fcc1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l216_c3_fcc1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l219_c4_bdd1,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l220_c27_8858_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l221_c22_c5c2_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l222_c30_53ea_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l223_c22_9780_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l224_c25_bc7e_return_output);

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l216_c3_fcc1_return_output;
     -- result_MUX[uxn_device_h_l216_c3_fcc1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l216_c3_fcc1_cond <= VAR_result_MUX_uxn_device_h_l216_c3_fcc1_cond;
     result_MUX_uxn_device_h_l216_c3_fcc1_iftrue <= VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iftrue;
     result_MUX_uxn_device_h_l216_c3_fcc1_iffalse <= VAR_result_MUX_uxn_device_h_l216_c3_fcc1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l216_c3_fcc1_return_output := result_MUX_uxn_device_h_l216_c3_fcc1_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l206_c7_bc70_iffalse := VAR_result_MUX_uxn_device_h_l216_c3_fcc1_return_output;
     -- result_MUX[uxn_device_h_l206_c7_bc70] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l206_c7_bc70_cond <= VAR_result_MUX_uxn_device_h_l206_c7_bc70_cond;
     result_MUX_uxn_device_h_l206_c7_bc70_iftrue <= VAR_result_MUX_uxn_device_h_l206_c7_bc70_iftrue;
     result_MUX_uxn_device_h_l206_c7_bc70_iffalse <= VAR_result_MUX_uxn_device_h_l206_c7_bc70_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l206_c7_bc70_return_output := result_MUX_uxn_device_h_l206_c7_bc70_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iffalse := VAR_result_MUX_uxn_device_h_l206_c7_bc70_return_output;
     -- result_MUX[uxn_device_h_l195_c7_d7f6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_d7f6_cond <= VAR_result_MUX_uxn_device_h_l195_c7_d7f6_cond;
     result_MUX_uxn_device_h_l195_c7_d7f6_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iftrue;
     result_MUX_uxn_device_h_l195_c7_d7f6_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_d7f6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_d7f6_return_output := result_MUX_uxn_device_h_l195_c7_d7f6_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_d7f6_return_output;
     -- result_MUX[uxn_device_h_l175_c7_dcfb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l175_c7_dcfb_cond <= VAR_result_MUX_uxn_device_h_l175_c7_dcfb_cond;
     result_MUX_uxn_device_h_l175_c7_dcfb_iftrue <= VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iftrue;
     result_MUX_uxn_device_h_l175_c7_dcfb_iffalse <= VAR_result_MUX_uxn_device_h_l175_c7_dcfb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l175_c7_dcfb_return_output := result_MUX_uxn_device_h_l175_c7_dcfb_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l148_c7_2400_iffalse := VAR_result_MUX_uxn_device_h_l175_c7_dcfb_return_output;
     -- result_MUX[uxn_device_h_l148_c7_2400] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l148_c7_2400_cond <= VAR_result_MUX_uxn_device_h_l148_c7_2400_cond;
     result_MUX_uxn_device_h_l148_c7_2400_iftrue <= VAR_result_MUX_uxn_device_h_l148_c7_2400_iftrue;
     result_MUX_uxn_device_h_l148_c7_2400_iffalse <= VAR_result_MUX_uxn_device_h_l148_c7_2400_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l148_c7_2400_return_output := result_MUX_uxn_device_h_l148_c7_2400_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iffalse := VAR_result_MUX_uxn_device_h_l148_c7_2400_return_output;
     -- result_MUX[uxn_device_h_l127_c7_b6a5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l127_c7_b6a5_cond <= VAR_result_MUX_uxn_device_h_l127_c7_b6a5_cond;
     result_MUX_uxn_device_h_l127_c7_b6a5_iftrue <= VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iftrue;
     result_MUX_uxn_device_h_l127_c7_b6a5_iffalse <= VAR_result_MUX_uxn_device_h_l127_c7_b6a5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l127_c7_b6a5_return_output := result_MUX_uxn_device_h_l127_c7_b6a5_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iffalse := VAR_result_MUX_uxn_device_h_l127_c7_b6a5_return_output;
     -- result_MUX[uxn_device_h_l122_c7_3c9d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l122_c7_3c9d_cond <= VAR_result_MUX_uxn_device_h_l122_c7_3c9d_cond;
     result_MUX_uxn_device_h_l122_c7_3c9d_iftrue <= VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iftrue;
     result_MUX_uxn_device_h_l122_c7_3c9d_iffalse <= VAR_result_MUX_uxn_device_h_l122_c7_3c9d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l122_c7_3c9d_return_output := result_MUX_uxn_device_h_l122_c7_3c9d_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iffalse := VAR_result_MUX_uxn_device_h_l122_c7_3c9d_return_output;
     -- result_MUX[uxn_device_h_l118_c7_e9fe] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l118_c7_e9fe_cond <= VAR_result_MUX_uxn_device_h_l118_c7_e9fe_cond;
     result_MUX_uxn_device_h_l118_c7_e9fe_iftrue <= VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iftrue;
     result_MUX_uxn_device_h_l118_c7_e9fe_iffalse <= VAR_result_MUX_uxn_device_h_l118_c7_e9fe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l118_c7_e9fe_return_output := result_MUX_uxn_device_h_l118_c7_e9fe_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iffalse := VAR_result_MUX_uxn_device_h_l118_c7_e9fe_return_output;
     -- result_MUX[uxn_device_h_l113_c7_9ce6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_9ce6_cond <= VAR_result_MUX_uxn_device_h_l113_c7_9ce6_cond;
     result_MUX_uxn_device_h_l113_c7_9ce6_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iftrue;
     result_MUX_uxn_device_h_l113_c7_9ce6_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_9ce6_return_output := result_MUX_uxn_device_h_l113_c7_9ce6_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l104_c7_cad6_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_9ce6_return_output;
     -- result_MUX[uxn_device_h_l104_c7_cad6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_cad6_cond <= VAR_result_MUX_uxn_device_h_l104_c7_cad6_cond;
     result_MUX_uxn_device_h_l104_c7_cad6_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_cad6_iftrue;
     result_MUX_uxn_device_h_l104_c7_cad6_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_cad6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_cad6_return_output := result_MUX_uxn_device_h_l104_c7_cad6_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l101_c7_73df_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_cad6_return_output;
     -- result_MUX[uxn_device_h_l101_c7_73df] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_73df_cond <= VAR_result_MUX_uxn_device_h_l101_c7_73df_cond;
     result_MUX_uxn_device_h_l101_c7_73df_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_73df_iftrue;
     result_MUX_uxn_device_h_l101_c7_73df_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_73df_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_73df_return_output := result_MUX_uxn_device_h_l101_c7_73df_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l88_c2_7c46_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_73df_return_output;
     -- result_MUX[uxn_device_h_l88_c2_7c46] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_7c46_cond <= VAR_result_MUX_uxn_device_h_l88_c2_7c46_cond;
     result_MUX_uxn_device_h_l88_c2_7c46_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_7c46_iftrue;
     result_MUX_uxn_device_h_l88_c2_7c46_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_7c46_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_7c46_return_output := result_MUX_uxn_device_h_l88_c2_7c46_return_output;

     -- Submodule level 28
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_7c46_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_7c46_return_output;
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
