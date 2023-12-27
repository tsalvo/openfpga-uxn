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
-- BIN_OP_EQ[uxn_device_h_l88_c6_c176]
signal BIN_OP_EQ_uxn_device_h_l88_c6_c176_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_c176_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_6ef6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_e718]
signal ram_addr_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_e718]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_e718]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_e718]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_e718]
signal color_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_e718]
signal auto_advance_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l88_c2_e718]
signal x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l88_c2_e718]
signal y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_e718]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_e718]
signal is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_e718]
signal flip_x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_e718]
signal flip_y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_e718]
signal is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_e718]
signal ctrl_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_e718]
signal layer_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_e718]
signal tmp8_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l88_c2_e718]
signal result_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_e718_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_e718_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_e718_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l89_c19_b44d]
signal BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_3ef5]
signal MUX_uxn_device_h_l89_c19_3ef5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_3ef5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_3ef5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_3ef5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_d56e]
signal BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_f9ae]
signal MUX_uxn_device_h_l90_c20_f9ae_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_f9ae_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_f9ae_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_f9ae_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_93dc]
signal BIN_OP_OR_uxn_device_h_l91_c21_93dc_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_93dc_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_864b]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_864b]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c32_6a8a]
signal MUX_uxn_device_h_l95_c32_6a8a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_6a8a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_6a8a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_6a8a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_dc73]
signal BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_2fbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_6ef6]
signal ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l101_c7_6ef6]
signal color_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_6ef6]
signal auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l101_c7_6ef6]
signal x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l101_c7_6ef6]
signal y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_6ef6]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_6ef6]
signal is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_6ef6]
signal flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_6ef6]
signal flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_6ef6]
signal is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_6ef6]
signal ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_6ef6]
signal layer_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_6ef6]
signal tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l101_c7_6ef6]
signal result_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_6ef6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_6ef6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_6ef6_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l104_c11_f219]
signal BIN_OP_EQ_uxn_device_h_l104_c11_f219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_f219_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_284a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_2fbb]
signal ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l104_c7_2fbb]
signal color_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_2fbb]
signal auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l104_c7_2fbb]
signal x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l104_c7_2fbb]
signal y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_2fbb]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_2fbb]
signal is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_2fbb]
signal flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_2fbb]
signal flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_2fbb]
signal is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_2fbb]
signal ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_2fbb]
signal layer_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_2fbb]
signal tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l104_c7_2fbb]
signal result_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_2fbb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_2fbb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_2fbb_return_output : device_out_result_t;

-- CONST_SR_7[uxn_device_h_l107_c25_e726]
signal CONST_SR_7_uxn_device_h_l107_c25_e726_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_e726_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_984c]
signal CONST_SR_6_uxn_device_h_l108_c21_984c_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_984c_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_fe75]
signal CONST_SR_5_uxn_device_h_l109_c22_fe75_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_bff6]
signal CONST_SR_4_uxn_device_h_l110_c22_bff6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_7172]
signal BIN_OP_EQ_uxn_device_h_l113_c11_7172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_7172_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_4d78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_284a]
signal ram_addr_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_284a]
signal auto_advance_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l113_c7_284a]
signal x_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l113_c7_284a]
signal y_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_284a]
signal is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_284a]
signal is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_284a]
signal tmp8_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l113_c7_284a]
signal result_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_284a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_284a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_284a_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l117_c11_32c5]
signal BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_54e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_4d78]
signal ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_4d78]
signal auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l117_c7_4d78]
signal x_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l117_c7_4d78]
signal y_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_4d78]
signal is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l117_c7_4d78]
signal is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_4d78]
signal tmp8_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l117_c7_4d78]
signal result_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_4d78_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_4d78_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_4d78_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l119_c3_c90c]
signal tmp8_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_c90c]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_c90c]
signal result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_c90c]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_c90c]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_c90c]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_c90c]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_4d83]
signal BIN_OP_AND_uxn_device_h_l121_c11_4d83_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_4d83_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_7631]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_6629]
signal tmp8_MUX_uxn_device_h_l125_c4_6629_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_6629_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_6629]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l126_c13_6523]
signal MUX_uxn_device_h_l126_c13_6523_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_6523_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_6523_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_6523_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_48c6]
signal BIN_OP_OR_uxn_device_h_l126_c5_48c6_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_48c6_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_8d8f]
signal MUX_uxn_device_h_l127_c13_8d8f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_8d8f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_8d8f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_8d8f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_c35a]
signal BIN_OP_OR_uxn_device_h_l127_c5_c35a_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_c35a_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_162b]
signal BIN_OP_EQ_uxn_device_h_l136_c11_162b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_162b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_ac3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l136_c7_54e6]
signal ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_54e6]
signal auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l136_c7_54e6]
signal x_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l136_c7_54e6]
signal y_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l136_c7_54e6]
signal is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l136_c7_54e6]
signal is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l136_c7_54e6]
signal result_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_54e6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_54e6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_54e6_return_output : device_out_result_t;

-- CONST_SR_1[uxn_device_h_l139_c15_fb1a]
signal CONST_SR_1_uxn_device_h_l139_c15_fb1a_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l140_c3_593e]
signal x_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l140_c3_593e]
signal y_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_593e]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_593e]
signal result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_593e]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_593e]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_593e]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_593e]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l144_c4_d425]
signal x_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l144_c4_d425]
signal y_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_d425]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_d425]
signal result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_d425]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_d425]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_a2da]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_ba70]
signal CONST_SR_8_uxn_device_h_l148_c33_ba70_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l149_c11_b91d]
signal y_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_b91d]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_b91d]
signal result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_b91d]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_b91d]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_d7c7]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_61b6]
signal CONST_SR_8_uxn_device_h_l153_c33_61b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_2b6b]
signal BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_8916]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l161_c7_ac3a]
signal ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l161_c7_ac3a]
signal y_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l161_c7_ac3a]
signal result_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_ac3a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_ac3a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_ac3a_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l162_c3_1e3c]
signal ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l162_c3_1e3c]
signal y_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_1e3c]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_1e3c]
signal result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_1e3c]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_1e3c]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l163_c4_d5a9]
signal y_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_d5a9]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_d5a9]
signal result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_d5a9]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_d5a9]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_923f]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_e765]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_a0c1]
signal BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_3d05]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l181_c7_8916]
signal ram_addr_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l181_c7_8916]
signal result_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_8916_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_8916_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_8916_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l182_c3_f6bd]
signal ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_f6bd]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_f6bd]
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_f6bd]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_859e]
signal CONST_SR_8_uxn_device_h_l186_c32_859e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_859e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_1534]
signal BIN_OP_OR_uxn_device_h_l189_c4_1534_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_1534_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_2cc0]
signal BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_df47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_3d05]
signal result_MUX_uxn_device_h_l192_c7_3d05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_3d05_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_3d05_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_3d05_return_output : device_out_result_t;

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_d625]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_d625]
signal result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_d625]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_d625]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_365d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_59e9]
signal result_MUX_uxn_device_h_l202_c3_59e9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_59e9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_59e9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_59e9_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_6d5c]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_eee4]
signal screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_eee4_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_6e67( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u16_addr := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_40a5( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_c176
BIN_OP_EQ_uxn_device_h_l88_c6_c176 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_c176_left,
BIN_OP_EQ_uxn_device_h_l88_c6_c176_right,
BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_e718
ram_addr_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_e718_cond,
ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_e718
is_sprite_port_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_e718
is_pixel_port_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_e718
is_drawing_port_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output);

-- color_MUX_uxn_device_h_l88_c2_e718
color_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_e718_cond,
color_MUX_uxn_device_h_l88_c2_e718_iftrue,
color_MUX_uxn_device_h_l88_c2_e718_iffalse,
color_MUX_uxn_device_h_l88_c2_e718_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_e718
auto_advance_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_e718_cond,
auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output);

-- x_MUX_uxn_device_h_l88_c2_e718
x_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_e718_cond,
x_MUX_uxn_device_h_l88_c2_e718_iftrue,
x_MUX_uxn_device_h_l88_c2_e718_iffalse,
x_MUX_uxn_device_h_l88_c2_e718_return_output);

-- y_MUX_uxn_device_h_l88_c2_e718
y_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_e718_cond,
y_MUX_uxn_device_h_l88_c2_e718_iftrue,
y_MUX_uxn_device_h_l88_c2_e718_iffalse,
y_MUX_uxn_device_h_l88_c2_e718_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_e718
ctrl_mode_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_e718
is_auto_y_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_e718
flip_x_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_e718_cond,
flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_e718_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_e718
flip_y_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_e718_cond,
flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_e718_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_e718
is_auto_x_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_e718
ctrl_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_e718_cond,
ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_e718_return_output);

-- layer_MUX_uxn_device_h_l88_c2_e718
layer_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_e718_cond,
layer_MUX_uxn_device_h_l88_c2_e718_iftrue,
layer_MUX_uxn_device_h_l88_c2_e718_iffalse,
layer_MUX_uxn_device_h_l88_c2_e718_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_e718
tmp8_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_e718_cond,
tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_e718_return_output);

-- result_MUX_uxn_device_h_l88_c2_e718
result_MUX_uxn_device_h_l88_c2_e718 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_e718_cond,
result_MUX_uxn_device_h_l88_c2_e718_iftrue,
result_MUX_uxn_device_h_l88_c2_e718_iffalse,
result_MUX_uxn_device_h_l88_c2_e718_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_b44d
BIN_OP_EQ_uxn_device_h_l89_c19_b44d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left,
BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right,
BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output);

-- MUX_uxn_device_h_l89_c19_3ef5
MUX_uxn_device_h_l89_c19_3ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_3ef5_cond,
MUX_uxn_device_h_l89_c19_3ef5_iftrue,
MUX_uxn_device_h_l89_c19_3ef5_iffalse,
MUX_uxn_device_h_l89_c19_3ef5_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_d56e
BIN_OP_EQ_uxn_device_h_l90_c20_d56e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left,
BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right,
BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output);

-- MUX_uxn_device_h_l90_c20_f9ae
MUX_uxn_device_h_l90_c20_f9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_f9ae_cond,
MUX_uxn_device_h_l90_c20_f9ae_iftrue,
MUX_uxn_device_h_l90_c20_f9ae_iffalse,
MUX_uxn_device_h_l90_c20_f9ae_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_93dc
BIN_OP_OR_uxn_device_h_l91_c21_93dc : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_93dc_left,
BIN_OP_OR_uxn_device_h_l91_c21_93dc_right,
BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_864b
result_device_ram_address_MUX_uxn_device_h_l94_c3_864b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_864b
result_is_deo_done_MUX_uxn_device_h_l94_c3_864b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output);

-- MUX_uxn_device_h_l95_c32_6a8a
MUX_uxn_device_h_l95_c32_6a8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_6a8a_cond,
MUX_uxn_device_h_l95_c32_6a8a_iftrue,
MUX_uxn_device_h_l95_c32_6a8a_iffalse,
MUX_uxn_device_h_l95_c32_6a8a_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_dc73
BIN_OP_EQ_uxn_device_h_l101_c11_dc73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left,
BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right,
BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_6ef6
ram_addr_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond,
ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- color_MUX_uxn_device_h_l101_c7_6ef6
color_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_6ef6_cond,
color_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
color_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
color_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_6ef6
auto_advance_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond,
auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- x_MUX_uxn_device_h_l101_c7_6ef6
x_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_6ef6_cond,
x_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
x_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
x_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- y_MUX_uxn_device_h_l101_c7_6ef6
y_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_6ef6_cond,
y_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
y_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
y_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6
ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_6ef6
is_auto_y_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_6ef6
flip_x_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond,
flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_6ef6
flip_y_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond,
flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_6ef6
is_auto_x_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_6ef6
ctrl_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond,
ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- layer_MUX_uxn_device_h_l101_c7_6ef6
layer_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_6ef6_cond,
layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
layer_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_6ef6
tmp8_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond,
tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- result_MUX_uxn_device_h_l101_c7_6ef6
result_MUX_uxn_device_h_l101_c7_6ef6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_6ef6_cond,
result_MUX_uxn_device_h_l101_c7_6ef6_iftrue,
result_MUX_uxn_device_h_l101_c7_6ef6_iffalse,
result_MUX_uxn_device_h_l101_c7_6ef6_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_f219
BIN_OP_EQ_uxn_device_h_l104_c11_f219 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_f219_left,
BIN_OP_EQ_uxn_device_h_l104_c11_f219_right,
BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_2fbb
ram_addr_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond,
ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- color_MUX_uxn_device_h_l104_c7_2fbb
color_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_2fbb_cond,
color_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
color_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
color_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_2fbb
auto_advance_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond,
auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- x_MUX_uxn_device_h_l104_c7_2fbb
x_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_2fbb_cond,
x_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
x_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
x_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- y_MUX_uxn_device_h_l104_c7_2fbb
y_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_2fbb_cond,
y_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
y_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
y_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb
ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_2fbb
is_auto_y_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_2fbb
flip_x_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond,
flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_2fbb
flip_y_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond,
flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_2fbb
is_auto_x_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_2fbb
ctrl_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond,
ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- layer_MUX_uxn_device_h_l104_c7_2fbb
layer_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_2fbb_cond,
layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
layer_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_2fbb
tmp8_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond,
tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- result_MUX_uxn_device_h_l104_c7_2fbb
result_MUX_uxn_device_h_l104_c7_2fbb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_2fbb_cond,
result_MUX_uxn_device_h_l104_c7_2fbb_iftrue,
result_MUX_uxn_device_h_l104_c7_2fbb_iffalse,
result_MUX_uxn_device_h_l104_c7_2fbb_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_e726
CONST_SR_7_uxn_device_h_l107_c25_e726 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_e726_x,
CONST_SR_7_uxn_device_h_l107_c25_e726_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_984c
CONST_SR_6_uxn_device_h_l108_c21_984c : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_984c_x,
CONST_SR_6_uxn_device_h_l108_c21_984c_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_fe75
CONST_SR_5_uxn_device_h_l109_c22_fe75 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_fe75_x,
CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_bff6
CONST_SR_4_uxn_device_h_l110_c22_bff6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_bff6_x,
CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_7172
BIN_OP_EQ_uxn_device_h_l113_c11_7172 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_7172_left,
BIN_OP_EQ_uxn_device_h_l113_c11_7172_right,
BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_284a
ram_addr_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_284a_cond,
ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_284a
auto_advance_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_284a_cond,
auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output);

-- x_MUX_uxn_device_h_l113_c7_284a
x_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_284a_cond,
x_MUX_uxn_device_h_l113_c7_284a_iftrue,
x_MUX_uxn_device_h_l113_c7_284a_iffalse,
x_MUX_uxn_device_h_l113_c7_284a_return_output);

-- y_MUX_uxn_device_h_l113_c7_284a
y_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_284a_cond,
y_MUX_uxn_device_h_l113_c7_284a_iftrue,
y_MUX_uxn_device_h_l113_c7_284a_iffalse,
y_MUX_uxn_device_h_l113_c7_284a_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_284a
is_auto_y_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_284a
is_auto_x_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_284a
tmp8_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_284a_cond,
tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_284a_return_output);

-- result_MUX_uxn_device_h_l113_c7_284a
result_MUX_uxn_device_h_l113_c7_284a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_284a_cond,
result_MUX_uxn_device_h_l113_c7_284a_iftrue,
result_MUX_uxn_device_h_l113_c7_284a_iffalse,
result_MUX_uxn_device_h_l113_c7_284a_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_32c5
BIN_OP_EQ_uxn_device_h_l117_c11_32c5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left,
BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right,
BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_4d78
ram_addr_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond,
ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_4d78
auto_advance_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond,
auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- x_MUX_uxn_device_h_l117_c7_4d78
x_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_4d78_cond,
x_MUX_uxn_device_h_l117_c7_4d78_iftrue,
x_MUX_uxn_device_h_l117_c7_4d78_iffalse,
x_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- y_MUX_uxn_device_h_l117_c7_4d78
y_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_4d78_cond,
y_MUX_uxn_device_h_l117_c7_4d78_iftrue,
y_MUX_uxn_device_h_l117_c7_4d78_iffalse,
y_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_4d78
is_auto_y_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_4d78
is_auto_x_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_4d78
tmp8_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_4d78_cond,
tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- result_MUX_uxn_device_h_l117_c7_4d78
result_MUX_uxn_device_h_l117_c7_4d78 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_4d78_cond,
result_MUX_uxn_device_h_l117_c7_4d78_iftrue,
result_MUX_uxn_device_h_l117_c7_4d78_iffalse,
result_MUX_uxn_device_h_l117_c7_4d78_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_c90c
tmp8_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_c90c_cond,
tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c
result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_c90c
result_u8_value_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c
result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c
result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_c90c
result_u16_addr_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_4d83
BIN_OP_AND_uxn_device_h_l121_c11_4d83 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_4d83_left,
BIN_OP_AND_uxn_device_h_l121_c11_4d83_right,
BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_7631
BIN_OP_PLUS_uxn_device_h_l122_c23_7631 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_6629
tmp8_MUX_uxn_device_h_l125_c4_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_6629_cond,
tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_6629_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_6629
result_is_deo_done_MUX_uxn_device_h_l125_c4_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output);

-- MUX_uxn_device_h_l126_c13_6523
MUX_uxn_device_h_l126_c13_6523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_6523_cond,
MUX_uxn_device_h_l126_c13_6523_iftrue,
MUX_uxn_device_h_l126_c13_6523_iffalse,
MUX_uxn_device_h_l126_c13_6523_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_48c6
BIN_OP_OR_uxn_device_h_l126_c5_48c6 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_48c6_left,
BIN_OP_OR_uxn_device_h_l126_c5_48c6_right,
BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output);

-- MUX_uxn_device_h_l127_c13_8d8f
MUX_uxn_device_h_l127_c13_8d8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_8d8f_cond,
MUX_uxn_device_h_l127_c13_8d8f_iftrue,
MUX_uxn_device_h_l127_c13_8d8f_iffalse,
MUX_uxn_device_h_l127_c13_8d8f_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_c35a
BIN_OP_OR_uxn_device_h_l127_c5_c35a : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_c35a_left,
BIN_OP_OR_uxn_device_h_l127_c5_c35a_right,
BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_162b
BIN_OP_EQ_uxn_device_h_l136_c11_162b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_162b_left,
BIN_OP_EQ_uxn_device_h_l136_c11_162b_right,
BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_54e6
ram_addr_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond,
ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_54e6
auto_advance_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond,
auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- x_MUX_uxn_device_h_l136_c7_54e6
x_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_54e6_cond,
x_MUX_uxn_device_h_l136_c7_54e6_iftrue,
x_MUX_uxn_device_h_l136_c7_54e6_iffalse,
x_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- y_MUX_uxn_device_h_l136_c7_54e6
y_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_54e6_cond,
y_MUX_uxn_device_h_l136_c7_54e6_iftrue,
y_MUX_uxn_device_h_l136_c7_54e6_iffalse,
y_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_54e6
is_auto_y_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_54e6
is_auto_x_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- result_MUX_uxn_device_h_l136_c7_54e6
result_MUX_uxn_device_h_l136_c7_54e6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_54e6_cond,
result_MUX_uxn_device_h_l136_c7_54e6_iftrue,
result_MUX_uxn_device_h_l136_c7_54e6_iffalse,
result_MUX_uxn_device_h_l136_c7_54e6_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_fb1a
CONST_SR_1_uxn_device_h_l139_c15_fb1a : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_fb1a_x,
CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output);

-- x_MUX_uxn_device_h_l140_c3_593e
x_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_593e_cond,
x_MUX_uxn_device_h_l140_c3_593e_iftrue,
x_MUX_uxn_device_h_l140_c3_593e_iffalse,
x_MUX_uxn_device_h_l140_c3_593e_return_output);

-- y_MUX_uxn_device_h_l140_c3_593e
y_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_593e_cond,
y_MUX_uxn_device_h_l140_c3_593e_iftrue,
y_MUX_uxn_device_h_l140_c3_593e_iffalse,
y_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_593e
result_device_ram_address_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_593e
result_u8_value_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_593e
result_is_deo_done_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_593e
result_is_vram_write_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_593e
result_u16_addr_MUX_uxn_device_h_l140_c3_593e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output);

-- x_MUX_uxn_device_h_l144_c4_d425
x_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_d425_cond,
x_MUX_uxn_device_h_l144_c4_d425_iftrue,
x_MUX_uxn_device_h_l144_c4_d425_iffalse,
x_MUX_uxn_device_h_l144_c4_d425_return_output);

-- y_MUX_uxn_device_h_l144_c4_d425
y_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_d425_cond,
y_MUX_uxn_device_h_l144_c4_d425_iftrue,
y_MUX_uxn_device_h_l144_c4_d425_iffalse,
y_MUX_uxn_device_h_l144_c4_d425_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_d425
result_device_ram_address_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_d425
result_u8_value_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_d425
result_is_deo_done_MUX_uxn_device_h_l144_c4_d425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_a2da
BIN_OP_PLUS_uxn_device_h_l145_c5_a2da : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_ba70
CONST_SR_8_uxn_device_h_l148_c33_ba70 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_ba70_x,
CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output);

-- y_MUX_uxn_device_h_l149_c11_b91d
y_MUX_uxn_device_h_l149_c11_b91d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_b91d_cond,
y_MUX_uxn_device_h_l149_c11_b91d_iftrue,
y_MUX_uxn_device_h_l149_c11_b91d_iffalse,
y_MUX_uxn_device_h_l149_c11_b91d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d
result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_b91d
result_u8_value_MUX_uxn_device_h_l149_c11_b91d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d
result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7
BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_61b6
CONST_SR_8_uxn_device_h_l153_c33_61b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_61b6_x,
CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_2b6b
BIN_OP_EQ_uxn_device_h_l161_c11_2b6b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left,
BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right,
BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_ac3a
ram_addr_MUX_uxn_device_h_l161_c7_ac3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond,
ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output);

-- y_MUX_uxn_device_h_l161_c7_ac3a
y_MUX_uxn_device_h_l161_c7_ac3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_ac3a_cond,
y_MUX_uxn_device_h_l161_c7_ac3a_iftrue,
y_MUX_uxn_device_h_l161_c7_ac3a_iffalse,
y_MUX_uxn_device_h_l161_c7_ac3a_return_output);

-- result_MUX_uxn_device_h_l161_c7_ac3a
result_MUX_uxn_device_h_l161_c7_ac3a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_ac3a_cond,
result_MUX_uxn_device_h_l161_c7_ac3a_iftrue,
result_MUX_uxn_device_h_l161_c7_ac3a_iffalse,
result_MUX_uxn_device_h_l161_c7_ac3a_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_1e3c
ram_addr_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond,
ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- y_MUX_uxn_device_h_l162_c3_1e3c
y_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_1e3c_cond,
y_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
y_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
y_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c
result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_1e3c
result_u8_value_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c
result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output);

-- y_MUX_uxn_device_h_l163_c4_d5a9
y_MUX_uxn_device_h_l163_c4_d5a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_d5a9_cond,
y_MUX_uxn_device_h_l163_c4_d5a9_iftrue,
y_MUX_uxn_device_h_l163_c4_d5a9_iffalse,
y_MUX_uxn_device_h_l163_c4_d5a9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9
result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_d5a9
result_u8_value_MUX_uxn_device_h_l163_c4_d5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9
result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_923f
UNARY_OP_NOT_uxn_device_h_l167_c27_923f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_e765
BIN_OP_PLUS_uxn_device_h_l169_c5_e765 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_a0c1
BIN_OP_EQ_uxn_device_h_l181_c11_a0c1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left,
BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right,
BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_8916
ram_addr_MUX_uxn_device_h_l181_c7_8916 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_8916_cond,
ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output);

-- result_MUX_uxn_device_h_l181_c7_8916
result_MUX_uxn_device_h_l181_c7_8916 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_8916_cond,
result_MUX_uxn_device_h_l181_c7_8916_iftrue,
result_MUX_uxn_device_h_l181_c7_8916_iffalse,
result_MUX_uxn_device_h_l181_c7_8916_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_f6bd
ram_addr_MUX_uxn_device_h_l182_c3_f6bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond,
ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_f6bd
result_u8_value_MUX_uxn_device_h_l182_c3_f6bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_859e
CONST_SR_8_uxn_device_h_l186_c32_859e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_859e_x,
CONST_SR_8_uxn_device_h_l186_c32_859e_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_1534
BIN_OP_OR_uxn_device_h_l189_c4_1534 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_1534_left,
BIN_OP_OR_uxn_device_h_l189_c4_1534_right,
BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_2cc0
BIN_OP_EQ_uxn_device_h_l192_c11_2cc0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left,
BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right,
BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output);

-- result_MUX_uxn_device_h_l192_c7_3d05
result_MUX_uxn_device_h_l192_c7_3d05 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_3d05_cond,
result_MUX_uxn_device_h_l192_c7_3d05_iftrue,
result_MUX_uxn_device_h_l192_c7_3d05_iffalse,
result_MUX_uxn_device_h_l192_c7_3d05_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_d625
result_device_ram_address_MUX_uxn_device_h_l193_c3_d625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_d625
result_u8_value_MUX_uxn_device_h_l193_c3_d625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_d625
result_is_deo_done_MUX_uxn_device_h_l193_c3_d625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output);

-- result_MUX_uxn_device_h_l202_c3_59e9
result_MUX_uxn_device_h_l202_c3_59e9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_59e9_cond,
result_MUX_uxn_device_h_l202_c3_59e9_iftrue,
result_MUX_uxn_device_h_l202_c3_59e9_iffalse,
result_MUX_uxn_device_h_l202_c3_59e9_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c
BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output);

-- screen_blit_uxn_device_h_l203_c46_eee4
screen_blit_uxn_device_h_l203_c46_eee4 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_eee4_phase,
screen_blit_uxn_device_h_l203_c46_eee4_ctrl,
screen_blit_uxn_device_h_l203_c46_eee4_auto_advance,
screen_blit_uxn_device_h_l203_c46_eee4_x,
screen_blit_uxn_device_h_l203_c46_eee4_y,
screen_blit_uxn_device_h_l203_c46_eee4_ram_addr,
screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_eee4_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output,
 color_MUX_uxn_device_h_l88_c2_e718_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output,
 x_MUX_uxn_device_h_l88_c2_e718_return_output,
 y_MUX_uxn_device_h_l88_c2_e718_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_e718_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_e718_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_e718_return_output,
 layer_MUX_uxn_device_h_l88_c2_e718_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_e718_return_output,
 result_MUX_uxn_device_h_l88_c2_e718_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output,
 MUX_uxn_device_h_l89_c19_3ef5_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output,
 MUX_uxn_device_h_l90_c20_f9ae_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output,
 MUX_uxn_device_h_l95_c32_6a8a_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 color_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 x_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 y_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 layer_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 result_MUX_uxn_device_h_l101_c7_6ef6_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 color_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 x_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 y_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 layer_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 result_MUX_uxn_device_h_l104_c7_2fbb_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_e726_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_984c_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output,
 x_MUX_uxn_device_h_l113_c7_284a_return_output,
 y_MUX_uxn_device_h_l113_c7_284a_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_284a_return_output,
 result_MUX_uxn_device_h_l113_c7_284a_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output,
 x_MUX_uxn_device_h_l117_c7_4d78_return_output,
 y_MUX_uxn_device_h_l117_c7_4d78_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output,
 result_MUX_uxn_device_h_l117_c7_4d78_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_6629_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output,
 MUX_uxn_device_h_l126_c13_6523_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output,
 MUX_uxn_device_h_l127_c13_8d8f_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output,
 x_MUX_uxn_device_h_l136_c7_54e6_return_output,
 y_MUX_uxn_device_h_l136_c7_54e6_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output,
 result_MUX_uxn_device_h_l136_c7_54e6_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output,
 x_MUX_uxn_device_h_l140_c3_593e_return_output,
 y_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output,
 x_MUX_uxn_device_h_l144_c4_d425_return_output,
 y_MUX_uxn_device_h_l144_c4_d425_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output,
 y_MUX_uxn_device_h_l149_c11_b91d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output,
 y_MUX_uxn_device_h_l161_c7_ac3a_return_output,
 result_MUX_uxn_device_h_l161_c7_ac3a_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 y_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output,
 y_MUX_uxn_device_h_l163_c4_d5a9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output,
 result_MUX_uxn_device_h_l181_c7_8916_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_859e_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output,
 result_MUX_uxn_device_h_l192_c7_3d05_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output,
 result_MUX_uxn_device_h_l202_c3_59e9_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output,
 screen_blit_uxn_device_h_l203_c46_eee4_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_e718_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_e718_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_e718_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6ef6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_e718_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_e718_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_3ef5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_3ef5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_3ef5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_3ef5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_f9ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_f9ae_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_f9ae_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_f9ae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6a8a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6a8a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6a8a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6a8a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6ef6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_2fbb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6ef6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_2fbb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_284a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_2fbb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_982e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_8751_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_f68e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_a5d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_f5f5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_284a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_284a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_284a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_4d78_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_284a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_4d78_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7_uxn_device_h_l117_c7_4d78_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_4d78_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_54e6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_4d78_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_962c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_3a16 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_9c16 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_6523_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_6523_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_6523_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_6523_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_8d8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_8d8f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_8d8f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_8d8f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_0c24 : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_ac3a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_1dca : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_1338 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_54e6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6e67_uxn_device_h_l136_c7_54e6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_54e6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_ac3a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_x : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_43f2 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_4f77 : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_a4bd : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a916_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_5285 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_e082_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l161_c7_ac3a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_8916_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_ac3a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_f60b : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_2b13_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_0e7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_8916_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l181_c7_8916_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_8916_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_3d05_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_8916_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_17b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_3d05_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l192_c7_3d05_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_3d05_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_59e9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_3d05_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_bdd9_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_59e9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_59e9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_59e9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_59e9_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_16d5 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_92a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_2f8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_1cab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_488e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_f1ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_c04f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output : unsigned(0 downto 0);
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
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_f9ae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right := to_unsigned(1, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse := to_unsigned(43, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue := to_unsigned(42, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_right := to_unsigned(5, 8);
     VAR_MUX_uxn_device_h_l126_c13_6523_iffalse := to_unsigned(16, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_3ef5_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_f9ae_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l126_c13_6523_iftrue := to_unsigned(24, 8);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_962c := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_962c;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right := to_unsigned(7, 8);
     VAR_MUX_uxn_device_h_l127_c13_8d8f_iffalse := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l95_c32_6a8a_iffalse := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l89_c19_3ef5_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_16d5 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right := to_unsigned(9, 8);
     VAR_result_u8_value_uxn_device_h_l143_c4_4f77 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_4f77;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_6a8a_iftrue := to_unsigned(46, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l127_c13_8d8f_iftrue := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse := to_unsigned(44, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse := to_unsigned(45, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_right := to_unsigned(3, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue := to_unsigned(1, 1);
     VAR_result_u16_addr_uxn_device_h_l142_c4_43f2 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_43f2;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_e718_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_6523_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_8d8f_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_d5a9_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_593e_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_1e3c_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_59e9_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_e718_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_0c24 := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_59e9_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_4d78_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_54e6_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_593e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_d425_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_e718_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_284a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_593e_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_d425_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_b91d_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_e718_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_x := VAR_auto_advance_uxn_device_h_l137_c3_0c24;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_0c24;
     VAR_is_auto_x_uxn_device_h_l138_c3_1338 := resize(VAR_auto_advance_uxn_device_h_l137_c3_0c24, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_x_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     VAR_y_MUX_uxn_device_h_l144_c4_d425_cond := VAR_is_auto_x_uxn_device_h_l138_c3_1338;
     -- BIN_OP_EQ[uxn_device_h_l89_c19_b44d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_32c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output := result.is_device_ram_write;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_982e] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_982e_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_7[uxn_device_h_l107_c25_e726] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_e726_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_return_output := CONST_SR_7_uxn_device_h_l107_c25_e726_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_d5a9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_f1ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_f1ad_return_output := result.is_vram_write;

     -- CONST_SR_6[uxn_device_h_l108_c21_984c] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_984c_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_return_output := CONST_SR_6_uxn_device_h_l108_c21_984c_return_output;

     -- MUX[uxn_device_h_l126_c13_6523] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_6523_cond <= VAR_MUX_uxn_device_h_l126_c13_6523_cond;
     MUX_uxn_device_h_l126_c13_6523_iftrue <= VAR_MUX_uxn_device_h_l126_c13_6523_iftrue;
     MUX_uxn_device_h_l126_c13_6523_iffalse <= VAR_MUX_uxn_device_h_l126_c13_6523_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_6523_return_output := MUX_uxn_device_h_l126_c13_6523_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_2fbb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_2fbb_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_a2da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_d56e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_7172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_7172_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_7172_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;

     -- MUX[uxn_device_h_l127_c13_8d8f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_8d8f_cond <= VAR_MUX_uxn_device_h_l127_c13_8d8f_cond;
     MUX_uxn_device_h_l127_c13_8d8f_iftrue <= VAR_MUX_uxn_device_h_l127_c13_8d8f_iftrue;
     MUX_uxn_device_h_l127_c13_8d8f_iffalse <= VAR_MUX_uxn_device_h_l127_c13_8d8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_8d8f_return_output := MUX_uxn_device_h_l127_c13_8d8f_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_923f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_2cc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_dc73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_162b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_162b_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_162b_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_2b13] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_2b13_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_6d5c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_c90c] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c90c_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_c04f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_c04f_return_output := result.u16_addr;

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_e765] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_d7c7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_c176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_c176_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_c176_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output := result.u8_value;

     -- CONST_SR_1[uxn_device_h_l139_c15_fb1a] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_fb1a_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output := CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_a0c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_AND[uxn_device_h_l121_c11_4d83] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_4d83_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_left;
     BIN_OP_AND_uxn_device_h_l121_c11_4d83_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output := BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_284a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_284a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_EQ[uxn_device_h_l161_c11_2b6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_bff6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_bff6_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output := CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output;

     -- CONST_SR_8[uxn_device_h_l186_c32_859e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_859e_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_return_output := CONST_SR_8_uxn_device_h_l186_c32_859e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_d5a9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_fe75] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_fe75_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output := CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_6ef6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6ef6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_bdd9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_bdd9_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l104_c11_f219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_f219_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_f219_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_9c16 := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_4d83_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_dc73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_2fbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_f219_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_284a_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_7172_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_4d78_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_32c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_162b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_ac3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_ac3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_2b6b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_8916_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_a0c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_3d05_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_2cc0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_e718_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_c176_return_output;
     VAR_MUX_uxn_device_h_l89_c19_3ef5_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_b44d_return_output;
     VAR_MUX_uxn_device_h_l90_c20_f9ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d56e_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_6d5c_return_output;
     VAR_x_uxn_device_h_l145_c5_a4bd := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a2da_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_5285 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_d7c7_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_f60b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_e765_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_284a_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_4d78_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l118_l189_l114_l177_DUPLICATE_500e_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_982e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_2b13_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_bdd9_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_c04f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l140_l119_DUPLICATE_c04f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l193_l119_l162_l125_l149_l144_DUPLICATE_4b81_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l140_l193_l162_l149_l182_DUPLICATE_c1d9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_f1ad_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l140_l119_DUPLICATE_f1ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l193_l162_l149_l94_l182_DUPLICATE_a13f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l140_l193_l119_l162_l182_DUPLICATE_de90_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_1dca := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_fb1a_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_right := VAR_MUX_uxn_device_h_l126_c13_6523_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_right := VAR_MUX_uxn_device_h_l127_c13_8d8f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_923f_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_284a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_284a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_d5a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_d5a9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_c90c_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_y_MUX_uxn_device_h_l149_c11_b91d_cond := VAR_is_auto_y_uxn_device_h_l139_c3_1dca;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_left := VAR_tmp8_uxn_device_h_l121_c4_9c16;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse := VAR_tmp8_uxn_device_h_l121_c4_9c16;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_x := VAR_x_uxn_device_h_l145_c5_a4bd;
     VAR_x_MUX_uxn_device_h_l144_c4_d425_iftrue := VAR_x_uxn_device_h_l145_c5_a4bd;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_x := VAR_y_uxn_device_h_l150_c5_5285;
     VAR_y_MUX_uxn_device_h_l149_c11_b91d_iftrue := VAR_y_uxn_device_h_l150_c5_5285;
     VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iffalse := VAR_y_uxn_device_h_l169_c5_f60b;
     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_f68e] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_f68e_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_984c_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_f5f5] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_f5f5_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_bff6_return_output);

     -- y_MUX[uxn_device_h_l163_c4_d5a9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_d5a9_cond <= VAR_y_MUX_uxn_device_h_l163_c4_d5a9_cond;
     y_MUX_uxn_device_h_l163_c4_d5a9_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iftrue;
     y_MUX_uxn_device_h_l163_c4_d5a9_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_d5a9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_d5a9_return_output := y_MUX_uxn_device_h_l163_c4_d5a9_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output := auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_1534] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_1534_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_left;
     BIN_OP_OR_uxn_device_h_l189_c4_1534_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output := BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_f6bd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_d625] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_f6bd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_6629] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output;

     -- BIN_OP_OR[uxn_device_h_l126_c5_48c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_48c6_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_left;
     BIN_OP_OR_uxn_device_h_l126_c5_48c6_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output := BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_a5d9] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_a5d9_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_fe75_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_d5a9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_d625] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- MUX[uxn_device_h_l89_c19_3ef5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_3ef5_cond <= VAR_MUX_uxn_device_h_l89_c19_3ef5_cond;
     MUX_uxn_device_h_l89_c19_3ef5_iftrue <= VAR_MUX_uxn_device_h_l89_c19_3ef5_iftrue;
     MUX_uxn_device_h_l89_c19_3ef5_iffalse <= VAR_MUX_uxn_device_h_l89_c19_3ef5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_3ef5_return_output := MUX_uxn_device_h_l89_c19_3ef5_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_0e7f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_0e7f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_f60b);

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_d625] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_17b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_17b1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_859e_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_cond;
     ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output := ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_8751] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_8751_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_e726_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_b91d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output;

     -- y_MUX[uxn_device_h_l149_c11_b91d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_b91d_cond <= VAR_y_MUX_uxn_device_h_l149_c11_b91d_cond;
     y_MUX_uxn_device_h_l149_c11_b91d_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_b91d_iftrue;
     y_MUX_uxn_device_h_l149_c11_b91d_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_b91d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_b91d_return_output := y_MUX_uxn_device_h_l149_c11_b91d_return_output;

     -- x_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_x_MUX_uxn_device_h_l144_c4_d425_cond;
     x_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_d425_iftrue;
     x_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_d425_return_output := x_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_b91d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_b91d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output;

     -- CONST_SR_8[uxn_device_h_l148_c33_ba70] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_ba70_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output := CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output;

     -- MUX[uxn_device_h_l90_c20_f9ae] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_f9ae_cond <= VAR_MUX_uxn_device_h_l90_c20_f9ae_cond;
     MUX_uxn_device_h_l90_c20_f9ae_iftrue <= VAR_MUX_uxn_device_h_l90_c20_f9ae_iftrue;
     MUX_uxn_device_h_l90_c20_f9ae_iffalse <= VAR_MUX_uxn_device_h_l90_c20_f9ae_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_f9ae_return_output := MUX_uxn_device_h_l90_c20_f9ae_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_d625] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output;

     -- color_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_color_MUX_uxn_device_h_l104_c7_2fbb_cond;
     color_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     color_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_2fbb_return_output := color_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- CONST_SR_8[uxn_device_h_l153_c33_61b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_61b6_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output := CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_48c6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_1534_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_8751_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_f68e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_a5d9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_f5f5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_0e7f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_17b1_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_65e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_left := VAR_MUX_uxn_device_h_l89_c19_3ef5_return_output;
     VAR_MUX_uxn_device_h_l95_c32_6a8a_cond := VAR_MUX_uxn_device_h_l89_c19_3ef5_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue := VAR_MUX_uxn_device_h_l89_c19_3ef5_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_right := VAR_MUX_uxn_device_h_l90_c20_f9ae_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue := VAR_MUX_uxn_device_h_l90_c20_f9ae_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_b91d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_6629_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_b91d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_d5a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_b91d_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_d425_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_b91d_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_d5a9_return_output;
     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_e082] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_e082_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_61b6_return_output);

     -- is_auto_x_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- y_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_y_MUX_uxn_device_h_l144_c4_d425_cond;
     y_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_d425_iftrue;
     y_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_d425_return_output := y_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_cond;
     flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output := flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- MUX[uxn_device_h_l95_c32_6a8a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_6a8a_cond <= VAR_MUX_uxn_device_h_l95_c32_6a8a_cond;
     MUX_uxn_device_h_l95_c32_6a8a_iftrue <= VAR_MUX_uxn_device_h_l95_c32_6a8a_iftrue;
     MUX_uxn_device_h_l95_c32_6a8a_iffalse <= VAR_MUX_uxn_device_h_l95_c32_6a8a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_6a8a_return_output := MUX_uxn_device_h_l95_c32_6a8a_return_output;

     -- x_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_x_MUX_uxn_device_h_l140_c3_593e_cond;
     x_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_593e_iftrue;
     x_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_593e_return_output := x_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_cond;
     flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output := flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_93dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_93dc_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_left;
     BIN_OP_OR_uxn_device_h_l91_c21_93dc_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output := BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_cond;
     layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_return_output := layer_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- y_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_y_MUX_uxn_device_h_l162_c3_1e3c_cond;
     y_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     y_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_1e3c_return_output := y_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_cond;
     ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output := ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- is_auto_y_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_f6bd] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output := ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output := auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- color_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_color_MUX_uxn_device_h_l101_c7_6ef6_cond;
     color_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     color_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_6ef6_return_output := color_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- ram_addr_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output := ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- BIN_OP_OR[uxn_device_h_l127_c5_c35a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_c35a_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_left;
     BIN_OP_OR_uxn_device_h_l127_c5_c35a_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output := BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l163_c4_d5a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_7631] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_a916] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a916_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_ba70_return_output);

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5[uxn_device_h_l192_c7_3d05] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l192_c7_3d05_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_40a5(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_d625_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_d625_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_d625_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_d625_return_output);

     -- result_u8_value_MUX[uxn_device_h_l182_c3_f6bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_c35a_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_93dc_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_3a16 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_7631_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_a916_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_e082_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue := VAR_MUX_uxn_device_h_l95_c32_6a8a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_4d78_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_1e3c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_f6bd_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_3d05_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l192_c7_3d05_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_d5a9_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_593e_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_1e3c_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_3a16;
     -- y_MUX[uxn_device_h_l161_c7_ac3a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_ac3a_cond <= VAR_y_MUX_uxn_device_h_l161_c7_ac3a_cond;
     y_MUX_uxn_device_h_l161_c7_ac3a_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iftrue;
     y_MUX_uxn_device_h_l161_c7_ac3a_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_ac3a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_ac3a_return_output := y_MUX_uxn_device_h_l161_c7_ac3a_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_cond;
     flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output := flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output := auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- y_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_y_MUX_uxn_device_h_l140_c3_593e_cond;
     y_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_593e_iftrue;
     y_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_593e_return_output := y_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- x_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_x_MUX_uxn_device_h_l136_c7_54e6_cond;
     x_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     x_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_54e6_return_output := x_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_b91d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- ram_addr_MUX[uxn_device_h_l181_c7_8916] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_8916_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output := ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_cond;
     ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_return_output := ctrl_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_6629] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_6629_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_cond;
     tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_return_output := tmp8_MUX_uxn_device_h_l125_c4_6629_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_cond;
     flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output := flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- color_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_color_MUX_uxn_device_h_l88_c2_e718_cond;
     color_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_e718_iftrue;
     color_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_e718_return_output := color_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3[uxn_device_h_l181_c7_8916] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l181_c7_8916_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_f6bd_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_f6bd_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_f6bd_return_output);

     -- layer_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_cond;
     layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_return_output := layer_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l162_c3_1e3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_864b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_864b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_284a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_284a_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_284a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_284a_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_8916_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_8916_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l181_c7_8916_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_b91d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_6629_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_593e_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_54e6_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_ac3a_return_output;
     -- x_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_x_MUX_uxn_device_h_l117_c7_4d78_cond;
     x_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     x_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_4d78_return_output := x_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_cond;
     flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_return_output := flip_x_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output := auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_d425] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output;

     -- ram_addr_MUX[uxn_device_h_l161_c7_ac3a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output := ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l88_c2_e718] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_e718_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_864b_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_864b_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5[uxn_device_h_l161_c7_ac3a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l161_c7_ac3a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_40a5(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_1e3c_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_1e3c_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_1e3c_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_1e3c_return_output);

     -- y_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_y_MUX_uxn_device_h_l136_c7_54e6_cond;
     y_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     y_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_54e6_return_output := y_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_cond;
     flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_return_output := flip_y_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_e718_cond;
     layer_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_e718_iftrue;
     layer_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_e718_return_output := layer_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- is_auto_x_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_cond;
     tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output := tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_c90c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_ac3a_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_40a5_uxn_device_h_l161_c7_ac3a_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_e718_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_e718_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_d425_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_c90c_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_54e6_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7[uxn_device_h_l117_c7_4d78] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7_uxn_device_h_l117_c7_4d78_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_c90c_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_c90c_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_c90c_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_c90c_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_c90c_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_c90c_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output := auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output := ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_cond;
     tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output := tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- is_auto_x_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l140_c3_593e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output;

     -- y_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_y_MUX_uxn_device_h_l117_c7_4d78_cond;
     y_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     y_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_4d78_return_output := y_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- x_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_x_MUX_uxn_device_h_l113_c7_284a_cond;
     x_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_284a_iftrue;
     x_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_284a_return_output := x_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_54e6_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_4d78_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d7a7_uxn_device_h_l117_c7_4d78_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_284a_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_4d78_return_output;
     -- is_auto_x_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6e67[uxn_device_h_l136_c7_54e6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6e67_uxn_device_h_l136_c7_54e6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_6e67(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_593e_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_593e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_593e_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_593e_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_593e_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_593e_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_ac3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_cond;
     tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_return_output := tmp8_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- y_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_y_MUX_uxn_device_h_l113_c7_284a_cond;
     y_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_284a_iftrue;
     y_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_284a_return_output := y_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- x_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_x_MUX_uxn_device_h_l104_c7_2fbb_cond;
     x_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     x_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_2fbb_return_output := x_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output := ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output := auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_ac3a_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_4d78_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_54e6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6e67_uxn_device_h_l136_c7_54e6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_284a_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_284a_return_output;
     -- ram_addr_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output := ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_cond;
     tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output := tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_8916] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output;

     -- y_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_y_MUX_uxn_device_h_l104_c7_2fbb_cond;
     y_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     y_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_2fbb_return_output := y_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- x_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_x_MUX_uxn_device_h_l101_c7_6ef6_cond;
     x_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     x_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_6ef6_return_output := x_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_8916_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_284a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     -- y_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_y_MUX_uxn_device_h_l101_c7_6ef6_cond;
     y_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     y_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_6ef6_return_output := y_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- x_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_x_MUX_uxn_device_h_l88_c2_e718_cond;
     x_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_e718_iftrue;
     x_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_e718_return_output := x_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output := ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_3d05] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output;

     -- tmp8_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_cond;
     tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output := tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_3d05_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     -- tmp8_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_cond;
     tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_return_output := tmp8_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- y_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_y_MUX_uxn_device_h_l88_c2_e718_cond;
     y_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_e718_iftrue;
     y_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_e718_return_output := y_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output := ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_df47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_df47_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_e718_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_e718_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_365d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output;

     -- ram_addr_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output := ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_365d_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_e718_return_output;
     -- screen_blit[uxn_device_h_l203_c46_eee4] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_eee4_phase <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_phase;
     screen_blit_uxn_device_h_l203_c46_eee4_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_ctrl;
     screen_blit_uxn_device_h_l203_c46_eee4_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_auto_advance;
     screen_blit_uxn_device_h_l203_c46_eee4_x <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_x;
     screen_blit_uxn_device_h_l203_c46_eee4_y <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_y;
     screen_blit_uxn_device_h_l203_c46_eee4_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_ram_addr;
     screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_eee4_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output := screen_blit_uxn_device_h_l203_c46_eee4_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_1cab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_1cab_return_output := VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_92a3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_92a3_return_output := VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_488e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_488e_return_output := VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_2f8b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_2f8b_return_output := VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_2e8b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_2e8b_return_output := VAR_screen_blit_uxn_device_h_l203_c46_eee4_return_output.is_blit_done;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_59e9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_59e9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_16d5,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_92a3_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_2f8b_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_1cab_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_488e_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_2e8b_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_59e9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_59e9_return_output;
     -- result_MUX[uxn_device_h_l202_c3_59e9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_59e9_cond <= VAR_result_MUX_uxn_device_h_l202_c3_59e9_cond;
     result_MUX_uxn_device_h_l202_c3_59e9_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_59e9_iftrue;
     result_MUX_uxn_device_h_l202_c3_59e9_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_59e9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_59e9_return_output := result_MUX_uxn_device_h_l202_c3_59e9_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_3d05_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_59e9_return_output;
     -- result_MUX[uxn_device_h_l192_c7_3d05] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_3d05_cond <= VAR_result_MUX_uxn_device_h_l192_c7_3d05_cond;
     result_MUX_uxn_device_h_l192_c7_3d05_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_3d05_iftrue;
     result_MUX_uxn_device_h_l192_c7_3d05_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_3d05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_3d05_return_output := result_MUX_uxn_device_h_l192_c7_3d05_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_8916_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_3d05_return_output;
     -- result_MUX[uxn_device_h_l181_c7_8916] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_8916_cond <= VAR_result_MUX_uxn_device_h_l181_c7_8916_cond;
     result_MUX_uxn_device_h_l181_c7_8916_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_8916_iftrue;
     result_MUX_uxn_device_h_l181_c7_8916_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_8916_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_8916_return_output := result_MUX_uxn_device_h_l181_c7_8916_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_8916_return_output;
     -- result_MUX[uxn_device_h_l161_c7_ac3a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_ac3a_cond <= VAR_result_MUX_uxn_device_h_l161_c7_ac3a_cond;
     result_MUX_uxn_device_h_l161_c7_ac3a_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iftrue;
     result_MUX_uxn_device_h_l161_c7_ac3a_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_ac3a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_ac3a_return_output := result_MUX_uxn_device_h_l161_c7_ac3a_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_54e6_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_ac3a_return_output;
     -- result_MUX[uxn_device_h_l136_c7_54e6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_54e6_cond <= VAR_result_MUX_uxn_device_h_l136_c7_54e6_cond;
     result_MUX_uxn_device_h_l136_c7_54e6_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_54e6_iftrue;
     result_MUX_uxn_device_h_l136_c7_54e6_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_54e6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_54e6_return_output := result_MUX_uxn_device_h_l136_c7_54e6_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_4d78_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_54e6_return_output;
     -- result_MUX[uxn_device_h_l117_c7_4d78] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_4d78_cond <= VAR_result_MUX_uxn_device_h_l117_c7_4d78_cond;
     result_MUX_uxn_device_h_l117_c7_4d78_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_4d78_iftrue;
     result_MUX_uxn_device_h_l117_c7_4d78_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_4d78_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_4d78_return_output := result_MUX_uxn_device_h_l117_c7_4d78_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_284a_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_4d78_return_output;
     -- result_MUX[uxn_device_h_l113_c7_284a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_284a_cond <= VAR_result_MUX_uxn_device_h_l113_c7_284a_cond;
     result_MUX_uxn_device_h_l113_c7_284a_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_284a_iftrue;
     result_MUX_uxn_device_h_l113_c7_284a_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_284a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_284a_return_output := result_MUX_uxn_device_h_l113_c7_284a_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_284a_return_output;
     -- result_MUX[uxn_device_h_l104_c7_2fbb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_2fbb_cond <= VAR_result_MUX_uxn_device_h_l104_c7_2fbb_cond;
     result_MUX_uxn_device_h_l104_c7_2fbb_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iftrue;
     result_MUX_uxn_device_h_l104_c7_2fbb_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_2fbb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_2fbb_return_output := result_MUX_uxn_device_h_l104_c7_2fbb_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_2fbb_return_output;
     -- result_MUX[uxn_device_h_l101_c7_6ef6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_6ef6_cond <= VAR_result_MUX_uxn_device_h_l101_c7_6ef6_cond;
     result_MUX_uxn_device_h_l101_c7_6ef6_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iftrue;
     result_MUX_uxn_device_h_l101_c7_6ef6_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_6ef6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_6ef6_return_output := result_MUX_uxn_device_h_l101_c7_6ef6_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_e718_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_6ef6_return_output;
     -- result_MUX[uxn_device_h_l88_c2_e718] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_e718_cond <= VAR_result_MUX_uxn_device_h_l88_c2_e718_cond;
     result_MUX_uxn_device_h_l88_c2_e718_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_e718_iftrue;
     result_MUX_uxn_device_h_l88_c2_e718_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_e718_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_e718_return_output := result_MUX_uxn_device_h_l88_c2_e718_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_e718_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_e718_return_output;
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
