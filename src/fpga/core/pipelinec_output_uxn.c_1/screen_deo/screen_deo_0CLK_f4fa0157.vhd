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
-- BIN_OP_EQ[uxn_device_h_l88_c6_df8d]
signal BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_0b55]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_6acf]
signal flip_y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_6acf]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_6acf]
signal is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_6acf]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_6acf]
signal ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_6acf]
signal flip_x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_6acf]
signal auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_6acf]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_6acf]
signal color_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l88_c2_6acf]
signal x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_6acf]
signal tmp8_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_6acf]
signal layer_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_6acf]
signal y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l88_c2_6acf]
signal result_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_6acf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_6acf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_6acf_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l88_c2_6acf]
signal ctrl_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_6acf]
signal is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_6acf]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_f5e4]
signal BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_6b0a]
signal MUX_uxn_device_h_l89_c19_6b0a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_6b0a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_6b0a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_6b0a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_d91d]
signal BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_0e1d]
signal MUX_uxn_device_h_l90_c20_0e1d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e1d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e1d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_0e1d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_5d45]
signal BIN_OP_OR_uxn_device_h_l91_c21_5d45_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_5d45_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_34fa]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_34fa]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l95_c32_85a5]
signal MUX_uxn_device_h_l95_c32_85a5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_85a5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_85a5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_85a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_681c]
signal BIN_OP_EQ_uxn_device_h_l101_c11_681c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_681c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_7054]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_0b55]
signal flip_y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_0b55]
signal is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_0b55]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_0b55]
signal ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_0b55]
signal flip_x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_0b55]
signal auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l101_c7_0b55]
signal color_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l101_c7_0b55]
signal x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_0b55]
signal tmp8_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_0b55]
signal layer_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_0b55]
signal y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l101_c7_0b55]
signal result_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_0b55_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_0b55_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_0b55_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l101_c7_0b55]
signal ctrl_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_0b55]
signal is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_74bf]
signal BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_0f51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_7054]
signal flip_y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_7054]
signal is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_7054]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_7054]
signal ram_addr_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_7054]
signal flip_x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_7054]
signal auto_advance_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l104_c7_7054]
signal color_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l104_c7_7054]
signal x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l104_c7_7054]
signal tmp8_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_7054]
signal layer_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l104_c7_7054]
signal y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l104_c7_7054]
signal result_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_7054_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_7054_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_7054_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l104_c7_7054]
signal ctrl_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_7054]
signal is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_141b]
signal CONST_SR_7_uxn_device_h_l107_c25_141b_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_141b_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_e006]
signal CONST_SR_6_uxn_device_h_l108_c21_e006_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_e006_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_4bc9]
signal CONST_SR_5_uxn_device_h_l109_c22_4bc9_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_383a]
signal CONST_SR_4_uxn_device_h_l110_c22_383a_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_383a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_73ae]
signal BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_f353]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_0f51]
signal is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_0f51]
signal ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_0f51]
signal auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l113_c7_0f51]
signal x_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l113_c7_0f51]
signal tmp8_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l113_c7_0f51]
signal y_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l113_c7_0f51]
signal result_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_0f51_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_0f51_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_0f51_return_output : device_out_result_t;

-- is_auto_x_MUX[uxn_device_h_l113_c7_0f51]
signal is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_82f7]
signal BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_8112]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_f353]
signal is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_f353]
signal ram_addr_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_f353]
signal auto_advance_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l117_c7_f353]
signal x_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_f353]
signal tmp8_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l117_c7_f353]
signal y_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l117_c7_f353]
signal result_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_f353_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_f353_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_f353_return_output : device_out_result_t;

-- is_auto_x_MUX[uxn_device_h_l117_c7_f353]
signal is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l119_c3_56fd]
signal tmp8_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_56fd]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_56fd]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_56fd]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_56fd]
signal result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_56fd]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_56fd]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_5b51]
signal BIN_OP_AND_uxn_device_h_l121_c11_5b51_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_5b51_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_808c]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_fc59]
signal tmp8_MUX_uxn_device_h_l125_c4_fc59_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_fc59]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l126_c13_2cfa]
signal MUX_uxn_device_h_l126_c13_2cfa_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_2cfa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_2cfa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_2cfa_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_4fac]
signal BIN_OP_OR_uxn_device_h_l126_c5_4fac_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_4fac_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_d90c]
signal MUX_uxn_device_h_l127_c13_d90c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_d90c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_d90c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_d90c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_e484]
signal BIN_OP_OR_uxn_device_h_l127_c5_e484_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_e484_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_044f]
signal BIN_OP_EQ_uxn_device_h_l136_c11_044f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_044f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_2e08]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l136_c7_8112]
signal is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l136_c7_8112]
signal ram_addr_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_8112]
signal auto_advance_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l136_c7_8112]
signal x_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l136_c7_8112]
signal y_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l136_c7_8112]
signal result_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_8112_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_8112_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_8112_return_output : device_out_result_t;

-- is_auto_x_MUX[uxn_device_h_l136_c7_8112]
signal is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l139_c15_acbf]
signal CONST_SR_1_uxn_device_h_l139_c15_acbf_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l140_c3_042d]
signal x_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l140_c3_042d]
signal y_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_042d]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_042d]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_042d]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_042d]
signal result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_042d]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_042d]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l144_c4_4b4c]
signal x_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l144_c4_4b4c]
signal y_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_4b4c]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_4b4c]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_4b4c]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_4b4c]
signal result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_a594]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_bf11]
signal CONST_SR_8_uxn_device_h_l148_c33_bf11_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l149_c11_5f26]
signal y_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_5f26]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_5f26]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_5f26]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_5f26]
signal result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_f293]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_29f1]
signal CONST_SR_8_uxn_device_h_l153_c33_29f1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_8da5]
signal BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_9d6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l161_c7_2e08]
signal ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l161_c7_2e08]
signal y_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l161_c7_2e08]
signal result_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_2e08_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_2e08_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_2e08_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l162_c3_ac11]
signal ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l162_c3_ac11]
signal y_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_ac11]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_ac11]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_ac11]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_ac11]
signal result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l163_c4_aaf5]
signal y_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_aaf5]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_aaf5]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_aaf5]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_aaf5]
signal result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_1105]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_2b75]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_0a46]
signal BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_ccb3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l181_c7_9d6f]
signal ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l181_c7_9d6f]
signal result_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_9d6f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_9d6f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_9d6f_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l182_c3_af0f]
signal ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_af0f]
signal result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_af0f]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_af0f]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_756d]
signal CONST_SR_8_uxn_device_h_l186_c32_756d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_756d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_34ab]
signal BIN_OP_OR_uxn_device_h_l189_c4_34ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_34ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_83c2]
signal BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_1e38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_ccb3]
signal result_MUX_uxn_device_h_l192_c7_ccb3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_ccb3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_ccb3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_ccb3_return_output : device_out_result_t;

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_0af0]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_0af0]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_0af0]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_0af0]
signal result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_05c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_fd6a]
signal result_MUX_uxn_device_h_l202_c3_fd6a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_fd6a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_fd6a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_fd6a_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_078e]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_b259]
signal screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b259_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_fb30( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.u16_addr := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_91b8( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_deo_done := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.u8_value := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_4bef( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.device_ram_address := ref_toks_2;
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
-- BIN_OP_EQ_uxn_device_h_l88_c6_df8d
BIN_OP_EQ_uxn_device_h_l88_c6_df8d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left,
BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right,
BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_6acf
flip_y_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_6acf_cond,
flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_6acf
is_drawing_port_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_6acf
is_auto_y_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_6acf
ctrl_mode_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_6acf
ram_addr_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond,
ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_6acf
flip_x_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_6acf_cond,
flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_6acf
auto_advance_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond,
auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_6acf
is_sprite_port_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- color_MUX_uxn_device_h_l88_c2_6acf
color_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_6acf_cond,
color_MUX_uxn_device_h_l88_c2_6acf_iftrue,
color_MUX_uxn_device_h_l88_c2_6acf_iffalse,
color_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- x_MUX_uxn_device_h_l88_c2_6acf
x_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_6acf_cond,
x_MUX_uxn_device_h_l88_c2_6acf_iftrue,
x_MUX_uxn_device_h_l88_c2_6acf_iffalse,
x_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_6acf
tmp8_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_6acf_cond,
tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- layer_MUX_uxn_device_h_l88_c2_6acf
layer_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_6acf_cond,
layer_MUX_uxn_device_h_l88_c2_6acf_iftrue,
layer_MUX_uxn_device_h_l88_c2_6acf_iffalse,
layer_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- y_MUX_uxn_device_h_l88_c2_6acf
y_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_6acf_cond,
y_MUX_uxn_device_h_l88_c2_6acf_iftrue,
y_MUX_uxn_device_h_l88_c2_6acf_iffalse,
y_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- result_MUX_uxn_device_h_l88_c2_6acf
result_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_6acf_cond,
result_MUX_uxn_device_h_l88_c2_6acf_iftrue,
result_MUX_uxn_device_h_l88_c2_6acf_iffalse,
result_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_6acf
ctrl_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_6acf_cond,
ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_6acf
is_auto_x_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_6acf
is_pixel_port_MUX_uxn_device_h_l88_c2_6acf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_f5e4
BIN_OP_EQ_uxn_device_h_l89_c19_f5e4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left,
BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right,
BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output);

-- MUX_uxn_device_h_l89_c19_6b0a
MUX_uxn_device_h_l89_c19_6b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_6b0a_cond,
MUX_uxn_device_h_l89_c19_6b0a_iftrue,
MUX_uxn_device_h_l89_c19_6b0a_iffalse,
MUX_uxn_device_h_l89_c19_6b0a_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_d91d
BIN_OP_EQ_uxn_device_h_l90_c20_d91d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left,
BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right,
BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output);

-- MUX_uxn_device_h_l90_c20_0e1d
MUX_uxn_device_h_l90_c20_0e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_0e1d_cond,
MUX_uxn_device_h_l90_c20_0e1d_iftrue,
MUX_uxn_device_h_l90_c20_0e1d_iffalse,
MUX_uxn_device_h_l90_c20_0e1d_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_5d45
BIN_OP_OR_uxn_device_h_l91_c21_5d45 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_5d45_left,
BIN_OP_OR_uxn_device_h_l91_c21_5d45_right,
BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa
result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa
result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output);

-- MUX_uxn_device_h_l95_c32_85a5
MUX_uxn_device_h_l95_c32_85a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_85a5_cond,
MUX_uxn_device_h_l95_c32_85a5_iftrue,
MUX_uxn_device_h_l95_c32_85a5_iffalse,
MUX_uxn_device_h_l95_c32_85a5_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_681c
BIN_OP_EQ_uxn_device_h_l101_c11_681c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_681c_left,
BIN_OP_EQ_uxn_device_h_l101_c11_681c_right,
BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_0b55
flip_y_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_0b55_cond,
flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_0b55
is_auto_y_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_0b55
ctrl_mode_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_0b55
ram_addr_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond,
ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_0b55
flip_x_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_0b55_cond,
flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_0b55
auto_advance_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond,
auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- color_MUX_uxn_device_h_l101_c7_0b55
color_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_0b55_cond,
color_MUX_uxn_device_h_l101_c7_0b55_iftrue,
color_MUX_uxn_device_h_l101_c7_0b55_iffalse,
color_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- x_MUX_uxn_device_h_l101_c7_0b55
x_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_0b55_cond,
x_MUX_uxn_device_h_l101_c7_0b55_iftrue,
x_MUX_uxn_device_h_l101_c7_0b55_iffalse,
x_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_0b55
tmp8_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_0b55_cond,
tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- layer_MUX_uxn_device_h_l101_c7_0b55
layer_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_0b55_cond,
layer_MUX_uxn_device_h_l101_c7_0b55_iftrue,
layer_MUX_uxn_device_h_l101_c7_0b55_iffalse,
layer_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- y_MUX_uxn_device_h_l101_c7_0b55
y_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_0b55_cond,
y_MUX_uxn_device_h_l101_c7_0b55_iftrue,
y_MUX_uxn_device_h_l101_c7_0b55_iffalse,
y_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- result_MUX_uxn_device_h_l101_c7_0b55
result_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_0b55_cond,
result_MUX_uxn_device_h_l101_c7_0b55_iftrue,
result_MUX_uxn_device_h_l101_c7_0b55_iffalse,
result_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_0b55
ctrl_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_0b55_cond,
ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_0b55
is_auto_x_MUX_uxn_device_h_l101_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_74bf
BIN_OP_EQ_uxn_device_h_l104_c11_74bf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left,
BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right,
BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_7054
flip_y_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_7054_cond,
flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_7054_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_7054
is_auto_y_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_7054
ctrl_mode_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_7054
ram_addr_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_7054_cond,
ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_7054
flip_x_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_7054_cond,
flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_7054_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_7054
auto_advance_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_7054_cond,
auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output);

-- color_MUX_uxn_device_h_l104_c7_7054
color_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_7054_cond,
color_MUX_uxn_device_h_l104_c7_7054_iftrue,
color_MUX_uxn_device_h_l104_c7_7054_iffalse,
color_MUX_uxn_device_h_l104_c7_7054_return_output);

-- x_MUX_uxn_device_h_l104_c7_7054
x_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_7054_cond,
x_MUX_uxn_device_h_l104_c7_7054_iftrue,
x_MUX_uxn_device_h_l104_c7_7054_iffalse,
x_MUX_uxn_device_h_l104_c7_7054_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_7054
tmp8_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_7054_cond,
tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_7054_return_output);

-- layer_MUX_uxn_device_h_l104_c7_7054
layer_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_7054_cond,
layer_MUX_uxn_device_h_l104_c7_7054_iftrue,
layer_MUX_uxn_device_h_l104_c7_7054_iffalse,
layer_MUX_uxn_device_h_l104_c7_7054_return_output);

-- y_MUX_uxn_device_h_l104_c7_7054
y_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_7054_cond,
y_MUX_uxn_device_h_l104_c7_7054_iftrue,
y_MUX_uxn_device_h_l104_c7_7054_iffalse,
y_MUX_uxn_device_h_l104_c7_7054_return_output);

-- result_MUX_uxn_device_h_l104_c7_7054
result_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_7054_cond,
result_MUX_uxn_device_h_l104_c7_7054_iftrue,
result_MUX_uxn_device_h_l104_c7_7054_iffalse,
result_MUX_uxn_device_h_l104_c7_7054_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_7054
ctrl_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_7054_cond,
ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_7054_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_7054
is_auto_x_MUX_uxn_device_h_l104_c7_7054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_141b
CONST_SR_7_uxn_device_h_l107_c25_141b : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_141b_x,
CONST_SR_7_uxn_device_h_l107_c25_141b_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_e006
CONST_SR_6_uxn_device_h_l108_c21_e006 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_e006_x,
CONST_SR_6_uxn_device_h_l108_c21_e006_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_4bc9
CONST_SR_5_uxn_device_h_l109_c22_4bc9 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_4bc9_x,
CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_383a
CONST_SR_4_uxn_device_h_l110_c22_383a : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_383a_x,
CONST_SR_4_uxn_device_h_l110_c22_383a_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_73ae
BIN_OP_EQ_uxn_device_h_l113_c11_73ae : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left,
BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right,
BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_0f51
is_auto_y_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_0f51
ram_addr_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond,
ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_0f51
auto_advance_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond,
auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- x_MUX_uxn_device_h_l113_c7_0f51
x_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_0f51_cond,
x_MUX_uxn_device_h_l113_c7_0f51_iftrue,
x_MUX_uxn_device_h_l113_c7_0f51_iffalse,
x_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_0f51
tmp8_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_0f51_cond,
tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- y_MUX_uxn_device_h_l113_c7_0f51
y_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_0f51_cond,
y_MUX_uxn_device_h_l113_c7_0f51_iftrue,
y_MUX_uxn_device_h_l113_c7_0f51_iffalse,
y_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- result_MUX_uxn_device_h_l113_c7_0f51
result_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_0f51_cond,
result_MUX_uxn_device_h_l113_c7_0f51_iftrue,
result_MUX_uxn_device_h_l113_c7_0f51_iffalse,
result_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_0f51
is_auto_x_MUX_uxn_device_h_l113_c7_0f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_82f7
BIN_OP_EQ_uxn_device_h_l117_c11_82f7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left,
BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right,
BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_f353
is_auto_y_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_f353
ram_addr_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_f353_cond,
ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_f353
auto_advance_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_f353_cond,
auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output);

-- x_MUX_uxn_device_h_l117_c7_f353
x_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_f353_cond,
x_MUX_uxn_device_h_l117_c7_f353_iftrue,
x_MUX_uxn_device_h_l117_c7_f353_iffalse,
x_MUX_uxn_device_h_l117_c7_f353_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_f353
tmp8_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_f353_cond,
tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_f353_return_output);

-- y_MUX_uxn_device_h_l117_c7_f353
y_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_f353_cond,
y_MUX_uxn_device_h_l117_c7_f353_iftrue,
y_MUX_uxn_device_h_l117_c7_f353_iffalse,
y_MUX_uxn_device_h_l117_c7_f353_return_output);

-- result_MUX_uxn_device_h_l117_c7_f353
result_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_f353_cond,
result_MUX_uxn_device_h_l117_c7_f353_iftrue,
result_MUX_uxn_device_h_l117_c7_f353_iffalse,
result_MUX_uxn_device_h_l117_c7_f353_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_f353
is_auto_x_MUX_uxn_device_h_l117_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_56fd
tmp8_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_56fd_cond,
tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd
result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd
result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd
result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_56fd
result_u8_value_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_56fd
result_u16_addr_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd
result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_5b51
BIN_OP_AND_uxn_device_h_l121_c11_5b51 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_5b51_left,
BIN_OP_AND_uxn_device_h_l121_c11_5b51_right,
BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_808c
BIN_OP_PLUS_uxn_device_h_l122_c23_808c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_fc59
tmp8_MUX_uxn_device_h_l125_c4_fc59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_fc59_cond,
tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59
result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output);

-- MUX_uxn_device_h_l126_c13_2cfa
MUX_uxn_device_h_l126_c13_2cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_2cfa_cond,
MUX_uxn_device_h_l126_c13_2cfa_iftrue,
MUX_uxn_device_h_l126_c13_2cfa_iffalse,
MUX_uxn_device_h_l126_c13_2cfa_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_4fac
BIN_OP_OR_uxn_device_h_l126_c5_4fac : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_4fac_left,
BIN_OP_OR_uxn_device_h_l126_c5_4fac_right,
BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output);

-- MUX_uxn_device_h_l127_c13_d90c
MUX_uxn_device_h_l127_c13_d90c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_d90c_cond,
MUX_uxn_device_h_l127_c13_d90c_iftrue,
MUX_uxn_device_h_l127_c13_d90c_iffalse,
MUX_uxn_device_h_l127_c13_d90c_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_e484
BIN_OP_OR_uxn_device_h_l127_c5_e484 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_e484_left,
BIN_OP_OR_uxn_device_h_l127_c5_e484_right,
BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_044f
BIN_OP_EQ_uxn_device_h_l136_c11_044f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_044f_left,
BIN_OP_EQ_uxn_device_h_l136_c11_044f_right,
BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_8112
is_auto_y_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_8112
ram_addr_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_8112_cond,
ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_8112
auto_advance_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_8112_cond,
auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output);

-- x_MUX_uxn_device_h_l136_c7_8112
x_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_8112_cond,
x_MUX_uxn_device_h_l136_c7_8112_iftrue,
x_MUX_uxn_device_h_l136_c7_8112_iffalse,
x_MUX_uxn_device_h_l136_c7_8112_return_output);

-- y_MUX_uxn_device_h_l136_c7_8112
y_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_8112_cond,
y_MUX_uxn_device_h_l136_c7_8112_iftrue,
y_MUX_uxn_device_h_l136_c7_8112_iffalse,
y_MUX_uxn_device_h_l136_c7_8112_return_output);

-- result_MUX_uxn_device_h_l136_c7_8112
result_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_8112_cond,
result_MUX_uxn_device_h_l136_c7_8112_iftrue,
result_MUX_uxn_device_h_l136_c7_8112_iffalse,
result_MUX_uxn_device_h_l136_c7_8112_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_8112
is_auto_x_MUX_uxn_device_h_l136_c7_8112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_acbf
CONST_SR_1_uxn_device_h_l139_c15_acbf : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_acbf_x,
CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output);

-- x_MUX_uxn_device_h_l140_c3_042d
x_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_042d_cond,
x_MUX_uxn_device_h_l140_c3_042d_iftrue,
x_MUX_uxn_device_h_l140_c3_042d_iffalse,
x_MUX_uxn_device_h_l140_c3_042d_return_output);

-- y_MUX_uxn_device_h_l140_c3_042d
y_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_042d_cond,
y_MUX_uxn_device_h_l140_c3_042d_iftrue,
y_MUX_uxn_device_h_l140_c3_042d_iffalse,
y_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_042d
result_is_deo_done_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_042d
result_device_ram_address_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_042d
result_is_vram_write_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_042d
result_u8_value_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_042d
result_u16_addr_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output);

-- x_MUX_uxn_device_h_l144_c4_4b4c
x_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_4b4c_cond,
x_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
x_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
x_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- y_MUX_uxn_device_h_l144_c4_4b4c
y_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_4b4c_cond,
y_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
y_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
y_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c
result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c
result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_4b4c
result_u8_value_MUX_uxn_device_h_l144_c4_4b4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_a594
BIN_OP_PLUS_uxn_device_h_l145_c5_a594 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_bf11
CONST_SR_8_uxn_device_h_l148_c33_bf11 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_bf11_x,
CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output);

-- y_MUX_uxn_device_h_l149_c11_5f26
y_MUX_uxn_device_h_l149_c11_5f26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_5f26_cond,
y_MUX_uxn_device_h_l149_c11_5f26_iftrue,
y_MUX_uxn_device_h_l149_c11_5f26_iffalse,
y_MUX_uxn_device_h_l149_c11_5f26_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26
result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26
result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_5f26
result_u8_value_MUX_uxn_device_h_l149_c11_5f26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_f293
BIN_OP_PLUS_uxn_device_h_l150_c5_f293 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_29f1
CONST_SR_8_uxn_device_h_l153_c33_29f1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_29f1_x,
CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_8da5
BIN_OP_EQ_uxn_device_h_l161_c11_8da5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left,
BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right,
BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_2e08
ram_addr_MUX_uxn_device_h_l161_c7_2e08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond,
ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output);

-- y_MUX_uxn_device_h_l161_c7_2e08
y_MUX_uxn_device_h_l161_c7_2e08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_2e08_cond,
y_MUX_uxn_device_h_l161_c7_2e08_iftrue,
y_MUX_uxn_device_h_l161_c7_2e08_iffalse,
y_MUX_uxn_device_h_l161_c7_2e08_return_output);

-- result_MUX_uxn_device_h_l161_c7_2e08
result_MUX_uxn_device_h_l161_c7_2e08 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_2e08_cond,
result_MUX_uxn_device_h_l161_c7_2e08_iftrue,
result_MUX_uxn_device_h_l161_c7_2e08_iffalse,
result_MUX_uxn_device_h_l161_c7_2e08_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_ac11
ram_addr_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond,
ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- y_MUX_uxn_device_h_l162_c3_ac11
y_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_ac11_cond,
y_MUX_uxn_device_h_l162_c3_ac11_iftrue,
y_MUX_uxn_device_h_l162_c3_ac11_iffalse,
y_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11
result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11
result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_ac11
result_u8_value_MUX_uxn_device_h_l162_c3_ac11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output);

-- y_MUX_uxn_device_h_l163_c4_aaf5
y_MUX_uxn_device_h_l163_c4_aaf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_aaf5_cond,
y_MUX_uxn_device_h_l163_c4_aaf5_iftrue,
y_MUX_uxn_device_h_l163_c4_aaf5_iffalse,
y_MUX_uxn_device_h_l163_c4_aaf5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5
result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5
result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_aaf5
result_u8_value_MUX_uxn_device_h_l163_c4_aaf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_1105
UNARY_OP_NOT_uxn_device_h_l167_c27_1105 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_2b75
BIN_OP_PLUS_uxn_device_h_l169_c5_2b75 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_0a46
BIN_OP_EQ_uxn_device_h_l181_c11_0a46 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left,
BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right,
BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_9d6f
ram_addr_MUX_uxn_device_h_l181_c7_9d6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond,
ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output);

-- result_MUX_uxn_device_h_l181_c7_9d6f
result_MUX_uxn_device_h_l181_c7_9d6f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_9d6f_cond,
result_MUX_uxn_device_h_l181_c7_9d6f_iftrue,
result_MUX_uxn_device_h_l181_c7_9d6f_iffalse,
result_MUX_uxn_device_h_l181_c7_9d6f_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_af0f
ram_addr_MUX_uxn_device_h_l182_c3_af0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond,
ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_af0f
result_u8_value_MUX_uxn_device_h_l182_c3_af0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f
result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_756d
CONST_SR_8_uxn_device_h_l186_c32_756d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_756d_x,
CONST_SR_8_uxn_device_h_l186_c32_756d_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_34ab
BIN_OP_OR_uxn_device_h_l189_c4_34ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_34ab_left,
BIN_OP_OR_uxn_device_h_l189_c4_34ab_right,
BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_83c2
BIN_OP_EQ_uxn_device_h_l192_c11_83c2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left,
BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right,
BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output);

-- result_MUX_uxn_device_h_l192_c7_ccb3
result_MUX_uxn_device_h_l192_c7_ccb3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_ccb3_cond,
result_MUX_uxn_device_h_l192_c7_ccb3_iftrue,
result_MUX_uxn_device_h_l192_c7_ccb3_iffalse,
result_MUX_uxn_device_h_l192_c7_ccb3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0
result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0
result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_0af0
result_u8_value_MUX_uxn_device_h_l193_c3_0af0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output);

-- result_MUX_uxn_device_h_l202_c3_fd6a
result_MUX_uxn_device_h_l202_c3_fd6a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_fd6a_cond,
result_MUX_uxn_device_h_l202_c3_fd6a_iftrue,
result_MUX_uxn_device_h_l202_c3_fd6a_iffalse,
result_MUX_uxn_device_h_l202_c3_fd6a_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_078e
BIN_OP_MINUS_uxn_device_h_l203_c58_078e : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output);

-- screen_blit_uxn_device_h_l203_c46_b259
screen_blit_uxn_device_h_l203_c46_b259 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_b259_phase,
screen_blit_uxn_device_h_l203_c46_b259_ctrl,
screen_blit_uxn_device_h_l203_c46_b259_auto_advance,
screen_blit_uxn_device_h_l203_c46_b259_x,
screen_blit_uxn_device_h_l203_c46_b259_y,
screen_blit_uxn_device_h_l203_c46_b259_ram_addr,
screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_b259_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output,
 color_MUX_uxn_device_h_l88_c2_6acf_return_output,
 x_MUX_uxn_device_h_l88_c2_6acf_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output,
 layer_MUX_uxn_device_h_l88_c2_6acf_return_output,
 y_MUX_uxn_device_h_l88_c2_6acf_return_output,
 result_MUX_uxn_device_h_l88_c2_6acf_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output,
 MUX_uxn_device_h_l89_c19_6b0a_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output,
 MUX_uxn_device_h_l90_c20_0e1d_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output,
 MUX_uxn_device_h_l95_c32_85a5_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output,
 color_MUX_uxn_device_h_l101_c7_0b55_return_output,
 x_MUX_uxn_device_h_l101_c7_0b55_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output,
 layer_MUX_uxn_device_h_l101_c7_0b55_return_output,
 y_MUX_uxn_device_h_l101_c7_0b55_return_output,
 result_MUX_uxn_device_h_l101_c7_0b55_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_7054_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_7054_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output,
 color_MUX_uxn_device_h_l104_c7_7054_return_output,
 x_MUX_uxn_device_h_l104_c7_7054_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_7054_return_output,
 layer_MUX_uxn_device_h_l104_c7_7054_return_output,
 y_MUX_uxn_device_h_l104_c7_7054_return_output,
 result_MUX_uxn_device_h_l104_c7_7054_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_7054_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_141b_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_e006_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_383a_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output,
 x_MUX_uxn_device_h_l113_c7_0f51_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output,
 y_MUX_uxn_device_h_l113_c7_0f51_return_output,
 result_MUX_uxn_device_h_l113_c7_0f51_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output,
 x_MUX_uxn_device_h_l117_c7_f353_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_f353_return_output,
 y_MUX_uxn_device_h_l117_c7_f353_return_output,
 result_MUX_uxn_device_h_l117_c7_f353_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output,
 MUX_uxn_device_h_l126_c13_2cfa_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output,
 MUX_uxn_device_h_l127_c13_d90c_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output,
 x_MUX_uxn_device_h_l136_c7_8112_return_output,
 y_MUX_uxn_device_h_l136_c7_8112_return_output,
 result_MUX_uxn_device_h_l136_c7_8112_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output,
 x_MUX_uxn_device_h_l140_c3_042d_return_output,
 y_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output,
 x_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 y_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output,
 y_MUX_uxn_device_h_l149_c11_5f26_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output,
 y_MUX_uxn_device_h_l161_c7_2e08_return_output,
 result_MUX_uxn_device_h_l161_c7_2e08_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output,
 y_MUX_uxn_device_h_l162_c3_ac11_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output,
 y_MUX_uxn_device_h_l163_c4_aaf5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output,
 result_MUX_uxn_device_h_l181_c7_9d6f_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_756d_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output,
 result_MUX_uxn_device_h_l192_c7_ccb3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output,
 result_MUX_uxn_device_h_l202_c3_fd6a_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output,
 screen_blit_uxn_device_h_l203_c46_b259_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_6acf_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6acf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6acf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_0b55_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6acf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_6b0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_6b0a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_6b0a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_6b0a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e1d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e1d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_0e1d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_85a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_85a5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_85a5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_85a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_0b55_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_0b55_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_0b55_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7054_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_7054_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7054_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7054_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_0f51_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_c2bb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_b18f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_acdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_b120_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_75e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_0f51_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_0f51_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_0f51_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_f353_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_f353_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4_uxn_device_h_l117_c7_f353_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_f353_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8112_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_77eb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_5860 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_288d : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_2cfa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_2cfa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_2cfa_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_2cfa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d90c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d90c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d90c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_d90c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_9896 : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_d4cd : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_2e08_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_8112_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fb30_uxn_device_h_l136_c7_8112_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8112_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_2e08_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_c69a : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_x : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_f302 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_e855 : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_8e39 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_d570_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_c73c : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_2e08_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_2e08_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_2e08_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l161_c7_2e08_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_2e08_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_9d6f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_2e08_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_e128 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_59c3_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_da42_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_9d6f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_ccb3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_9d6f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_41a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l192_c7_ccb3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_fd6a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_ccb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_ece6_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_fd6a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_fd6a_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_f2ab : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7dd6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3313_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_f343_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_0ea1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_8d49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_27b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_5d61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output : unsigned(0 downto 0);
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
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l95_c32_85a5_iftrue := to_unsigned(46, 8);
     VAR_MUX_uxn_device_h_l126_c13_2cfa_iftrue := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right := to_unsigned(6, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_85a5_iffalse := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right := to_unsigned(8, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l126_c13_2cfa_iffalse := to_unsigned(16, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse := to_unsigned(45, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue := to_unsigned(41, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue := to_unsigned(43, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right := to_unsigned(3, 8);
     VAR_MUX_uxn_device_h_l89_c19_6b0a_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right := to_unsigned(0, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_f2ab := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l89_c19_6b0a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l90_c20_0e1d_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right := to_unsigned(2, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue := to_unsigned(0, 1);
     VAR_result_u16_addr_uxn_device_h_l142_c4_f302 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_f302;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l127_c13_d90c_iffalse := to_unsigned(0, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l90_c20_0e1d_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l127_c13_d90c_iftrue := to_unsigned(4, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_77eb := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_77eb;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_right := to_unsigned(3, 4);
     VAR_result_u8_value_uxn_device_h_l143_c4_e855 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_e855;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right := to_unsigned(9, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_0b55_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_7054_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_6acf_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_2cfa_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_d90c_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_aaf5_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_042d_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_ac11_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_fd6a_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_7054_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_d4cd := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_0b55_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_7054_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_f353_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_8112_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_042d_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_6acf_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_0b55_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_7054_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_0f51_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_042d_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_5f26_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_2e08_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_ac11_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_6acf_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_x := VAR_auto_advance_uxn_device_h_l137_c3_d4cd;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_d4cd;
     VAR_is_auto_x_uxn_device_h_l138_c3_c69a := resize(VAR_auto_advance_uxn_device_h_l137_c3_d4cd, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_x_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     VAR_y_MUX_uxn_device_h_l144_c4_4b4c_cond := VAR_is_auto_x_uxn_device_h_l138_c3_c69a;
     -- CONST_SR_7[uxn_device_h_l107_c25_141b] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_141b_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_return_output := CONST_SR_7_uxn_device_h_l107_c25_141b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c11_8da5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_7054] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7054_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output := result.is_device_ram_write;

     -- CONST_SR_5[uxn_device_h_l109_c22_4bc9] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_4bc9_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output := CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_56fd] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_56fd_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_044f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_044f_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_044f_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_c2bb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_c2bb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l88_c6_df8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;

     -- CONST_SR_1[uxn_device_h_l139_c15_acbf] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_acbf_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output := CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output := result.device_ram_address;

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_1105] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_383a] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_383a_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_return_output := CONST_SR_4_uxn_device_h_l110_c22_383a_return_output;

     -- CONST_SR_6[uxn_device_h_l108_c21_e006] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_e006_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_return_output := CONST_SR_6_uxn_device_h_l108_c21_e006_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_a594] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_0b55] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_0b55_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l104_c11_74bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_f5e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_73ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_078e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_f293] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output;

     -- MUX[uxn_device_h_l127_c13_d90c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_d90c_cond <= VAR_MUX_uxn_device_h_l127_c13_d90c_cond;
     MUX_uxn_device_h_l127_c13_d90c_iftrue <= VAR_MUX_uxn_device_h_l127_c13_d90c_iftrue;
     MUX_uxn_device_h_l127_c13_d90c_iffalse <= VAR_MUX_uxn_device_h_l127_c13_d90c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_d90c_return_output := MUX_uxn_device_h_l127_c13_d90c_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_aaf5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output;

     -- BIN_OP_AND[uxn_device_h_l121_c11_5b51] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_5b51_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_left;
     BIN_OP_AND_uxn_device_h_l121_c11_5b51_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output := BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_aaf5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_d91d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_59c3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_59c3_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_ece6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_ece6_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_5d61 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_5d61_return_output := result.u16_addr;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_0a46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output;

     -- CONST_SR_8[uxn_device_h_l186_c32_756d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_756d_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_return_output := CONST_SR_8_uxn_device_h_l186_c32_756d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_2b75] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_27b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_27b9_return_output := result.is_vram_write;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_681c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_681c_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_681c_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_0f51] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_0f51_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- MUX[uxn_device_h_l126_c13_2cfa] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_2cfa_cond <= VAR_MUX_uxn_device_h_l126_c13_2cfa_cond;
     MUX_uxn_device_h_l126_c13_2cfa_iftrue <= VAR_MUX_uxn_device_h_l126_c13_2cfa_iftrue;
     MUX_uxn_device_h_l126_c13_2cfa_iffalse <= VAR_MUX_uxn_device_h_l126_c13_2cfa_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_2cfa_return_output := MUX_uxn_device_h_l126_c13_2cfa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_83c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_82f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_288d := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_5b51_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_681c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_7054_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_74bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_0f51_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_73ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_f353_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_82f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8112_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_044f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_2e08_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_2e08_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_8da5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_9d6f_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0a46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_ccb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_83c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_6acf_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_df8d_return_output;
     VAR_MUX_uxn_device_h_l89_c19_6b0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_f5e4_return_output;
     VAR_MUX_uxn_device_h_l90_c20_0e1d_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_d91d_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_b259_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_078e_return_output;
     VAR_x_uxn_device_h_l145_c5_8e39 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_a594_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_c73c := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_f293_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_e128 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_2b75_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_0f51_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_f353_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l114_l118_DUPLICATE_fe46_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_c2bb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_59c3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_ece6_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_5d61_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_5d61_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l144_l140_l193_l119_l162_l125_l149_DUPLICATE_9b45_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l193_l140_l162_l149_DUPLICATE_45b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_27b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_27b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l94_l182_l193_l162_l149_DUPLICATE_d234_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_501a_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_9896 := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_acbf_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_right := VAR_MUX_uxn_device_h_l126_c13_2cfa_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_right := VAR_MUX_uxn_device_h_l127_c13_d90c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_1105_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_0b55_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_0b55_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_7054_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_0f51_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_0f51_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_aaf5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_aaf5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_56fd_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_y_MUX_uxn_device_h_l149_c11_5f26_cond := VAR_is_auto_y_uxn_device_h_l139_c3_9896;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_left := VAR_tmp8_uxn_device_h_l121_c4_288d;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse := VAR_tmp8_uxn_device_h_l121_c4_288d;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_x := VAR_x_uxn_device_h_l145_c5_8e39;
     VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iftrue := VAR_x_uxn_device_h_l145_c5_8e39;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_x := VAR_y_uxn_device_h_l150_c5_c73c;
     VAR_y_MUX_uxn_device_h_l149_c11_5f26_iftrue := VAR_y_uxn_device_h_l150_c5_c73c;
     VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iffalse := VAR_y_uxn_device_h_l169_c5_e128;
     -- BIN_OP_OR[uxn_device_h_l126_c5_4fac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_4fac_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_left;
     BIN_OP_OR_uxn_device_h_l126_c5_4fac_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output := BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output;

     -- y_MUX[uxn_device_h_l163_c4_aaf5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_aaf5_cond <= VAR_y_MUX_uxn_device_h_l163_c4_aaf5_cond;
     y_MUX_uxn_device_h_l163_c4_aaf5_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iftrue;
     y_MUX_uxn_device_h_l163_c4_aaf5_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_aaf5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_aaf5_return_output := y_MUX_uxn_device_h_l163_c4_aaf5_return_output;

     -- x_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_x_MUX_uxn_device_h_l144_c4_4b4c_cond;
     x_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     x_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_4b4c_return_output := x_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output := auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_5f26] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_af0f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- CONST_SR_8[uxn_device_h_l153_c33_29f1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_29f1_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output := CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_fc59] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_5f26] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output;

     -- CONST_SR_8[uxn_device_h_l148_c33_bf11] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_bf11_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output := CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_0af0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_0af0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_0af0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_af0f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_75e0] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_75e0_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_383a_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_0af0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_b18f] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_b18f_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_141b_return_output);

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_34ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_34ab_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_left;
     BIN_OP_OR_uxn_device_h_l189_c4_34ab_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output := BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_acdc] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_acdc_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_e006_return_output);

     -- MUX[uxn_device_h_l89_c19_6b0a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_6b0a_cond <= VAR_MUX_uxn_device_h_l89_c19_6b0a_cond;
     MUX_uxn_device_h_l89_c19_6b0a_iftrue <= VAR_MUX_uxn_device_h_l89_c19_6b0a_iftrue;
     MUX_uxn_device_h_l89_c19_6b0a_iffalse <= VAR_MUX_uxn_device_h_l89_c19_6b0a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_6b0a_return_output := MUX_uxn_device_h_l89_c19_6b0a_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_b120] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_b120_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_4bc9_return_output);

     -- MUX[uxn_device_h_l90_c20_0e1d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_0e1d_cond <= VAR_MUX_uxn_device_h_l90_c20_0e1d_cond;
     MUX_uxn_device_h_l90_c20_0e1d_iftrue <= VAR_MUX_uxn_device_h_l90_c20_0e1d_iftrue;
     MUX_uxn_device_h_l90_c20_0e1d_iffalse <= VAR_MUX_uxn_device_h_l90_c20_0e1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_0e1d_return_output := MUX_uxn_device_h_l90_c20_0e1d_return_output;

     -- color_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_color_MUX_uxn_device_h_l104_c7_7054_cond;
     color_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_7054_iftrue;
     color_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_7054_return_output := color_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_aaf5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_41a5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_41a5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_756d_return_output);

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_cond;
     ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_return_output := ctrl_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- y_MUX[uxn_device_h_l149_c11_5f26] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_5f26_cond <= VAR_y_MUX_uxn_device_h_l149_c11_5f26_cond;
     y_MUX_uxn_device_h_l149_c11_5f26_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_5f26_iftrue;
     y_MUX_uxn_device_h_l149_c11_5f26_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_5f26_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_5f26_return_output := y_MUX_uxn_device_h_l149_c11_5f26_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_da42] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_da42_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_e128);

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_5f26] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_4fac_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_34ab_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_b18f_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_acdc_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_b120_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_75e0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_da42_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_41a5_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_f514_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_left := VAR_MUX_uxn_device_h_l89_c19_6b0a_return_output;
     VAR_MUX_uxn_device_h_l95_c32_85a5_cond := VAR_MUX_uxn_device_h_l89_c19_6b0a_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue := VAR_MUX_uxn_device_h_l89_c19_6b0a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_right := VAR_MUX_uxn_device_h_l90_c20_0e1d_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue := VAR_MUX_uxn_device_h_l90_c20_0e1d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5f26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_fc59_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5f26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_aaf5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5f26_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_5f26_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_ac11_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_aaf5_return_output;
     -- MUX[uxn_device_h_l95_c32_85a5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_85a5_cond <= VAR_MUX_uxn_device_h_l95_c32_85a5_cond;
     MUX_uxn_device_h_l95_c32_85a5_iftrue <= VAR_MUX_uxn_device_h_l95_c32_85a5_iftrue;
     MUX_uxn_device_h_l95_c32_85a5_iffalse <= VAR_MUX_uxn_device_h_l95_c32_85a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_85a5_return_output := MUX_uxn_device_h_l95_c32_85a5_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_5d45] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_5d45_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_left;
     BIN_OP_OR_uxn_device_h_l91_c21_5d45_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output := BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output;

     -- color_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_color_MUX_uxn_device_h_l101_c7_0b55_cond;
     color_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     color_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_0b55_return_output := color_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_1af4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_29f1_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_cond;
     ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output := ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_7054_cond;
     layer_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_7054_iftrue;
     layer_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_7054_return_output := layer_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- y_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_y_MUX_uxn_device_h_l144_c4_4b4c_cond;
     y_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     y_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_4b4c_return_output := y_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_af0f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output := ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output;

     -- BIN_OP_OR[uxn_device_h_l127_c5_e484] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_e484_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_left;
     BIN_OP_OR_uxn_device_h_l127_c5_e484_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output := BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_808c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output;

     -- ram_addr_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output := ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_cond;
     flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_return_output := flip_x_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- x_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_x_MUX_uxn_device_h_l140_c3_042d_cond;
     x_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_042d_iftrue;
     x_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_042d_return_output := x_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l163_c4_aaf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l182_c3_af0f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output := auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- is_auto_y_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- y_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_y_MUX_uxn_device_h_l162_c3_ac11_cond;
     y_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     y_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_ac11_return_output := y_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_cond;
     flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_return_output := flip_y_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_d570] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_d570_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_bf11_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8[uxn_device_h_l192_c7_ccb3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l192_c7_ccb3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_91b8(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_0af0_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_0af0_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_0af0_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_0af0_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- is_auto_x_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_e484_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_5d45_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_5860 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_808c_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_d570_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_1af4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue := VAR_MUX_uxn_device_h_l95_c32_85a5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_f353_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_ac11_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_af0f_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l192_c7_ccb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_aaf5_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_042d_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_2e08_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_ac11_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_5860;
     -- result_u16_addr_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_cond;
     flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output := flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef[uxn_device_h_l181_c7_9d6f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_9d6f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4bef(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_af0f_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_af0f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_af0f_return_output);

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- result_u8_value_MUX[uxn_device_h_l162_c3_ac11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_cond;
     ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output := ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- y_MUX[uxn_device_h_l161_c7_2e08] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_2e08_cond <= VAR_y_MUX_uxn_device_h_l161_c7_2e08_cond;
     y_MUX_uxn_device_h_l161_c7_2e08_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_2e08_iftrue;
     y_MUX_uxn_device_h_l161_c7_2e08_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_2e08_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_2e08_return_output := y_MUX_uxn_device_h_l161_c7_2e08_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_fc59] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_fc59_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_cond;
     tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output := tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_0b55_cond;
     layer_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     layer_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_0b55_return_output := layer_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- y_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_y_MUX_uxn_device_h_l140_c3_042d_cond;
     y_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_042d_iftrue;
     y_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_042d_return_output := y_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- ram_addr_MUX[uxn_device_h_l181_c7_9d6f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output := ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_34fa] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output;

     -- color_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_color_MUX_uxn_device_h_l88_c2_6acf_cond;
     color_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     color_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_6acf_return_output := color_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_cond;
     flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output := flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- auto_advance_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output := auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_5f26] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- x_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_x_MUX_uxn_device_h_l136_c7_8112_cond;
     x_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_8112_iftrue;
     x_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_8112_return_output := x_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_34fa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_0f51_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_0f51_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_0f51_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_0f51_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_9d6f_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_9d6f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5f26_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_fc59_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_042d_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_8112_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_2e08_return_output;
     -- is_auto_x_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- ram_addr_MUX[uxn_device_h_l161_c7_2e08] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output := ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output;

     -- y_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_y_MUX_uxn_device_h_l136_c7_8112_cond;
     y_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_8112_iftrue;
     y_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_8112_return_output := y_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_cond;
     flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output := flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8[uxn_device_h_l161_c7_2e08] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l161_c7_2e08_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_91b8(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_ac11_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_ac11_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_ac11_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_ac11_return_output);

     -- flip_y_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_cond;
     flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output := flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output := auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_56fd] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_56fd_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_cond;
     tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output := tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l88_c2_6acf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6acf_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_34fa_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_34fa_return_output);

     -- x_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_x_MUX_uxn_device_h_l117_c7_f353_cond;
     x_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_f353_iftrue;
     x_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_f353_return_output := x_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_6acf_cond;
     layer_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     layer_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_6acf_return_output := layer_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_4b4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_7054_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_7054_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_2e08_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_6acf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_6acf_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_2e08_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_91b8_uxn_device_h_l161_c7_2e08_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_4b4c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_56fd_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_8112_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4[uxn_device_h_l117_c7_f353] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4_uxn_device_h_l117_c7_f353_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_56fd_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_56fd_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_56fd_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_56fd_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_56fd_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_56fd_return_output);

     -- result_u8_value_MUX[uxn_device_h_l140_c3_042d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output := ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output := auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- y_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_y_MUX_uxn_device_h_l117_c7_f353_cond;
     y_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_f353_iftrue;
     y_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_f353_return_output := y_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- is_auto_x_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_cond;
     tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_return_output := tmp8_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- x_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_x_MUX_uxn_device_h_l113_c7_0f51_cond;
     x_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     x_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_0f51_return_output := x_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_8112_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_f353_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c2a4_uxn_device_h_l117_c7_f353_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_0f51_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_f353_return_output;
     -- y_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_y_MUX_uxn_device_h_l113_c7_0f51_cond;
     y_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     y_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_0f51_return_output := y_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_2e08] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fb30[uxn_device_h_l136_c7_8112] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fb30_uxn_device_h_l136_c7_8112_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_fb30(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_042d_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_042d_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_042d_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_042d_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_042d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_042d_return_output);

     -- auto_advance_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output := auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- x_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_x_MUX_uxn_device_h_l104_c7_7054_cond;
     x_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_7054_iftrue;
     x_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_7054_return_output := x_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_cond;
     tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output := tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output := ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_2e08_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_f353_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_8112_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fb30_uxn_device_h_l136_c7_8112_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_0f51_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_0f51_return_output;
     -- x_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_x_MUX_uxn_device_h_l101_c7_0b55_cond;
     x_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     x_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_0b55_return_output := x_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_9d6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output;

     -- ram_addr_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output := ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_cond;
     tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_return_output := tmp8_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- y_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_y_MUX_uxn_device_h_l104_c7_7054_cond;
     y_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_7054_iftrue;
     y_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_7054_return_output := y_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_9d6f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_0f51_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_0b55_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_7054_return_output;
     -- y_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_y_MUX_uxn_device_h_l101_c7_0b55_cond;
     y_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     y_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_0b55_return_output := y_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_ccb3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output := ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- x_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_x_MUX_uxn_device_h_l88_c2_6acf_cond;
     x_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     x_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_6acf_return_output := x_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- tmp8_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_cond;
     tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output := tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_ccb3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_7054_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_0b55_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_0b55_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_1e38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output;

     -- y_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_y_MUX_uxn_device_h_l88_c2_6acf_cond;
     y_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     y_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_6acf_return_output := y_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_cond;
     tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output := tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output := ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_1e38_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_0b55_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_6acf_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_6acf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_05c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output;

     -- ram_addr_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output := ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_05c8_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_6acf_return_output;
     -- screen_blit[uxn_device_h_l203_c46_b259] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_b259_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_b259_phase <= VAR_screen_blit_uxn_device_h_l203_c46_b259_phase;
     screen_blit_uxn_device_h_l203_c46_b259_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_b259_ctrl;
     screen_blit_uxn_device_h_l203_c46_b259_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_b259_auto_advance;
     screen_blit_uxn_device_h_l203_c46_b259_x <= VAR_screen_blit_uxn_device_h_l203_c46_b259_x;
     screen_blit_uxn_device_h_l203_c46_b259_y <= VAR_screen_blit_uxn_device_h_l203_c46_b259_y;
     screen_blit_uxn_device_h_l203_c46_b259_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_b259_ram_addr;
     screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_b259_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output := screen_blit_uxn_device_h_l203_c46_b259_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_0ea1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_0ea1_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_7dd6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7dd6_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_8d49] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_8d49_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output.is_blit_done;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_3313] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3313_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_f343] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_f343_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b259_return_output.vram_write_layer;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_fd6a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_fd6a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_f2ab,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7dd6_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_3313_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_f343_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_0ea1_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_8d49_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_fd6a_return_output;
     -- result_MUX[uxn_device_h_l202_c3_fd6a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_fd6a_cond <= VAR_result_MUX_uxn_device_h_l202_c3_fd6a_cond;
     result_MUX_uxn_device_h_l202_c3_fd6a_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iftrue;
     result_MUX_uxn_device_h_l202_c3_fd6a_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_fd6a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_fd6a_return_output := result_MUX_uxn_device_h_l202_c3_fd6a_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_fd6a_return_output;
     -- result_MUX[uxn_device_h_l192_c7_ccb3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_ccb3_cond <= VAR_result_MUX_uxn_device_h_l192_c7_ccb3_cond;
     result_MUX_uxn_device_h_l192_c7_ccb3_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iftrue;
     result_MUX_uxn_device_h_l192_c7_ccb3_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_ccb3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_ccb3_return_output := result_MUX_uxn_device_h_l192_c7_ccb3_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_ccb3_return_output;
     -- result_MUX[uxn_device_h_l181_c7_9d6f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_9d6f_cond <= VAR_result_MUX_uxn_device_h_l181_c7_9d6f_cond;
     result_MUX_uxn_device_h_l181_c7_9d6f_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iftrue;
     result_MUX_uxn_device_h_l181_c7_9d6f_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_9d6f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_9d6f_return_output := result_MUX_uxn_device_h_l181_c7_9d6f_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_2e08_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_9d6f_return_output;
     -- result_MUX[uxn_device_h_l161_c7_2e08] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_2e08_cond <= VAR_result_MUX_uxn_device_h_l161_c7_2e08_cond;
     result_MUX_uxn_device_h_l161_c7_2e08_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_2e08_iftrue;
     result_MUX_uxn_device_h_l161_c7_2e08_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_2e08_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_2e08_return_output := result_MUX_uxn_device_h_l161_c7_2e08_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_8112_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_2e08_return_output;
     -- result_MUX[uxn_device_h_l136_c7_8112] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_8112_cond <= VAR_result_MUX_uxn_device_h_l136_c7_8112_cond;
     result_MUX_uxn_device_h_l136_c7_8112_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_8112_iftrue;
     result_MUX_uxn_device_h_l136_c7_8112_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_8112_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_8112_return_output := result_MUX_uxn_device_h_l136_c7_8112_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_f353_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_8112_return_output;
     -- result_MUX[uxn_device_h_l117_c7_f353] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_f353_cond <= VAR_result_MUX_uxn_device_h_l117_c7_f353_cond;
     result_MUX_uxn_device_h_l117_c7_f353_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_f353_iftrue;
     result_MUX_uxn_device_h_l117_c7_f353_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_f353_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_f353_return_output := result_MUX_uxn_device_h_l117_c7_f353_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_0f51_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_f353_return_output;
     -- result_MUX[uxn_device_h_l113_c7_0f51] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_0f51_cond <= VAR_result_MUX_uxn_device_h_l113_c7_0f51_cond;
     result_MUX_uxn_device_h_l113_c7_0f51_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_0f51_iftrue;
     result_MUX_uxn_device_h_l113_c7_0f51_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_0f51_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_0f51_return_output := result_MUX_uxn_device_h_l113_c7_0f51_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_7054_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_0f51_return_output;
     -- result_MUX[uxn_device_h_l104_c7_7054] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_7054_cond <= VAR_result_MUX_uxn_device_h_l104_c7_7054_cond;
     result_MUX_uxn_device_h_l104_c7_7054_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_7054_iftrue;
     result_MUX_uxn_device_h_l104_c7_7054_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_7054_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_7054_return_output := result_MUX_uxn_device_h_l104_c7_7054_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_0b55_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_7054_return_output;
     -- result_MUX[uxn_device_h_l101_c7_0b55] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_0b55_cond <= VAR_result_MUX_uxn_device_h_l101_c7_0b55_cond;
     result_MUX_uxn_device_h_l101_c7_0b55_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_0b55_iftrue;
     result_MUX_uxn_device_h_l101_c7_0b55_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_0b55_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_0b55_return_output := result_MUX_uxn_device_h_l101_c7_0b55_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_6acf_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_0b55_return_output;
     -- result_MUX[uxn_device_h_l88_c2_6acf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_6acf_cond <= VAR_result_MUX_uxn_device_h_l88_c2_6acf_cond;
     result_MUX_uxn_device_h_l88_c2_6acf_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_6acf_iftrue;
     result_MUX_uxn_device_h_l88_c2_6acf_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_6acf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_6acf_return_output := result_MUX_uxn_device_h_l88_c2_6acf_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_6acf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_6acf_return_output;
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
