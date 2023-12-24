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
-- BIN_OP_EQ[uxn_device_h_l88_c6_235c]
signal BIN_OP_EQ_uxn_device_h_l88_c6_235c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_235c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_932d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_d6e9]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l88_c2_d6e9]
signal is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_d6e9]
signal auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l88_c2_d6e9]
signal result_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_d6e9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_d6e9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_d6e9_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l88_c2_d6e9]
signal tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l88_c2_d6e9]
signal is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_d6e9]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l88_c2_d6e9]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_d6e9]
signal ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_d6e9]
signal flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_d6e9]
signal flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_d6e9]
signal ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_d6e9]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_d6e9]
signal y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_d6e9]
signal layer_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l88_c2_d6e9]
signal color_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l88_c2_d6e9]
signal x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_ec82]
signal BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_59d5]
signal MUX_uxn_device_h_l89_c19_59d5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_59d5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_59d5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_59d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_997c]
signal BIN_OP_EQ_uxn_device_h_l90_c20_997c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_997c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_59f4]
signal MUX_uxn_device_h_l90_c20_59f4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_59f4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_59f4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_59f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_0507]
signal BIN_OP_OR_uxn_device_h_l91_c21_0507_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_0507_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_0535]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_0535]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c32_14ce]
signal MUX_uxn_device_h_l95_c32_14ce_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_14ce_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_14ce_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_14ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_80a8]
signal BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_13d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l101_c7_932d]
signal is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_932d]
signal auto_advance_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l101_c7_932d]
signal result_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_932d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_932d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_932d_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l101_c7_932d]
signal tmp8_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l101_c7_932d]
signal is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l101_c7_932d]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_932d]
signal ctrl_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_932d]
signal flip_x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_932d]
signal flip_y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_932d]
signal ram_addr_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l101_c7_932d]
signal y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_932d]
signal layer_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l101_c7_932d]
signal color_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l101_c7_932d]
signal x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l104_c11_05e7]
signal BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_7b59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l104_c7_13d7]
signal is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l104_c7_13d7]
signal auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l104_c7_13d7]
signal result_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l104_c7_13d7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_13d7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l104_c7_13d7_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l104_c7_13d7]
signal tmp8_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l104_c7_13d7]
signal is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l104_c7_13d7]
signal ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l104_c7_13d7]
signal ctrl_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l104_c7_13d7]
signal flip_x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l104_c7_13d7]
signal flip_y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l104_c7_13d7]
signal ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l104_c7_13d7]
signal y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l104_c7_13d7]
signal layer_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l104_c7_13d7]
signal color_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l104_c7_13d7]
signal x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);

-- CONST_SR_7[uxn_device_h_l107_c25_ea24]
signal CONST_SR_7_uxn_device_h_l107_c25_ea24_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l108_c21_234d]
signal CONST_SR_6_uxn_device_h_l108_c21_234d_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l108_c21_234d_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l109_c22_16fd]
signal CONST_SR_5_uxn_device_h_l109_c22_16fd_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l110_c22_dc54]
signal CONST_SR_4_uxn_device_h_l110_c22_dc54_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l113_c11_cfde]
signal BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_2f45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l113_c7_7b59]
signal is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l113_c7_7b59]
signal auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l113_c7_7b59]
signal result_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l113_c7_7b59_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_7b59_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l113_c7_7b59_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l113_c7_7b59]
signal tmp8_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l113_c7_7b59]
signal is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l113_c7_7b59]
signal ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l113_c7_7b59]
signal y_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l113_c7_7b59]
signal x_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_8afc]
signal BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_f304]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l117_c7_2f45]
signal is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_2f45]
signal auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l117_c7_2f45]
signal result_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_2f45_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_2f45_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_2f45_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l117_c7_2f45]
signal tmp8_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l117_c7_2f45]
signal is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_2f45]
signal ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l117_c7_2f45]
signal y_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l117_c7_2f45]
signal x_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l119_c3_88eb]
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l119_c3_88eb]
signal result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_88eb]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l119_c3_88eb]
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_88eb]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l119_c3_88eb]
signal result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l119_c3_88eb]
signal tmp8_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l121_c11_5841]
signal BIN_OP_AND_uxn_device_h_l121_c11_5841_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_5841_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l122_c23_952c]
signal BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output : unsigned(16 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c4_7b32]
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l125_c4_7b32]
signal tmp8_MUX_uxn_device_h_l125_c4_7b32_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l126_c13_0b30]
signal MUX_uxn_device_h_l126_c13_0b30_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c13_0b30_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_0b30_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c13_0b30_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c5_54cd]
signal BIN_OP_OR_uxn_device_h_l126_c5_54cd_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_54cd_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l127_c13_dc8c]
signal MUX_uxn_device_h_l127_c13_dc8c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l127_c13_dc8c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_dc8c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l127_c13_dc8c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l127_c5_5d5b]
signal BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l136_c11_c994]
signal BIN_OP_EQ_uxn_device_h_l136_c11_c994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_c994_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_60aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l136_c7_f304]
signal is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l136_c7_f304]
signal auto_advance_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l136_c7_f304]
signal result_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l136_c7_f304_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_f304_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l136_c7_f304_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l136_c7_f304]
signal is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l136_c7_f304]
signal ram_addr_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l136_c7_f304]
signal y_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l136_c7_f304]
signal x_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l139_c15_5850]
signal CONST_SR_1_uxn_device_h_l139_c15_5850_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l139_c15_5850_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l140_c3_0431]
signal result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_0431]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l140_c3_0431]
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_0431]
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l140_c3_0431]
signal result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_0431]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l140_c3_0431]
signal y_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l140_c3_0431]
signal x_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l144_c4_5352]
signal result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c4_5352]
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c4_5352]
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_5352]
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l144_c4_5352]
signal y_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l144_c4_5352]
signal x_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c5_5987]
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l148_c33_a010]
signal CONST_SR_8_uxn_device_h_l148_c33_a010_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l148_c33_a010_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c11_5ba0]
signal result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c11_5ba0]
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c11_5ba0]
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_5ba0]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l149_c11_5ba0]
signal y_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c5_9a69]
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l153_c33_581f]
signal CONST_SR_8_uxn_device_h_l153_c33_581f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l153_c33_581f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c11_464d]
signal BIN_OP_EQ_uxn_device_h_l161_c11_464d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_464d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_3470]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l161_c7_60aa]
signal result_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c7_60aa_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_60aa_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c7_60aa_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l161_c7_60aa]
signal ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l161_c7_60aa]
signal y_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l162_c3_6a43]
signal result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c3_6a43]
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c3_6a43]
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_6a43]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l162_c3_6a43]
signal ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l162_c3_6a43]
signal y_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_8360]
signal result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_8360]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_8360]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_8360]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l163_c4_8360]
signal y_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l167_c27_0689]
signal UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l169_c5_18c9]
signal BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_0660]
signal BIN_OP_EQ_uxn_device_h_l181_c11_0660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0660_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_506d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_3470]
signal result_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_3470_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_3470_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_3470_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l181_c7_3470]
signal ram_addr_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l182_c3_4936]
signal result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l182_c3_4936]
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_4936]
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l182_c3_4936]
signal ram_addr_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l186_c32_72e5]
signal CONST_SR_8_uxn_device_h_l186_c32_72e5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c4_8b27]
signal BIN_OP_OR_uxn_device_h_l189_c4_8b27_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_8b27_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_c48a]
signal BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_6f5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l192_c7_506d]
signal result_MUX_uxn_device_h_l192_c7_506d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_506d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_506d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_506d_return_output : device_out_result_t;

-- result_u8_value_MUX[uxn_device_h_l193_c3_35ee]
signal result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_35ee]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_35ee]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_35ee]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_0a47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l202_c3_5d3f]
signal result_MUX_uxn_device_h_l202_c3_5d3f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l202_c3_5d3f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_5d3f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l202_c3_5d3f_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l203_c58_3960]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_b8ed]
signal screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_b8ed_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_0254( ref_toks_0 : device_out_result_t;
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
      base.vram_write_layer := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.u16_addr := ref_toks_6;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;
      base.is_deo_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_36d3( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_235c
BIN_OP_EQ_uxn_device_h_l88_c6_235c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_235c_left,
BIN_OP_EQ_uxn_device_h_l88_c6_235c_right,
BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9
is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- is_auto_x_MUX_uxn_device_h_l88_c2_d6e9
is_auto_x_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond,
is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_d6e9
auto_advance_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond,
auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- result_MUX_uxn_device_h_l88_c2_d6e9
result_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_d6e9_cond,
result_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
result_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
result_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_d6e9
tmp8_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond,
tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- is_auto_y_MUX_uxn_device_h_l88_c2_d6e9
is_auto_y_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond,
is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9
is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9
ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_d6e9
ctrl_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond,
ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_d6e9
flip_x_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond,
flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_d6e9
flip_y_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond,
flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_d6e9
ram_addr_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond,
ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9
is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- y_MUX_uxn_device_h_l88_c2_d6e9
y_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_d6e9_cond,
y_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
y_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
y_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- layer_MUX_uxn_device_h_l88_c2_d6e9
layer_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_d6e9_cond,
layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
layer_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- color_MUX_uxn_device_h_l88_c2_d6e9
color_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_d6e9_cond,
color_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
color_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
color_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- x_MUX_uxn_device_h_l88_c2_d6e9
x_MUX_uxn_device_h_l88_c2_d6e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_d6e9_cond,
x_MUX_uxn_device_h_l88_c2_d6e9_iftrue,
x_MUX_uxn_device_h_l88_c2_d6e9_iffalse,
x_MUX_uxn_device_h_l88_c2_d6e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_ec82
BIN_OP_EQ_uxn_device_h_l89_c19_ec82 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left,
BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right,
BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output);

-- MUX_uxn_device_h_l89_c19_59d5
MUX_uxn_device_h_l89_c19_59d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_59d5_cond,
MUX_uxn_device_h_l89_c19_59d5_iftrue,
MUX_uxn_device_h_l89_c19_59d5_iffalse,
MUX_uxn_device_h_l89_c19_59d5_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_997c
BIN_OP_EQ_uxn_device_h_l90_c20_997c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_997c_left,
BIN_OP_EQ_uxn_device_h_l90_c20_997c_right,
BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output);

-- MUX_uxn_device_h_l90_c20_59f4
MUX_uxn_device_h_l90_c20_59f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_59f4_cond,
MUX_uxn_device_h_l90_c20_59f4_iftrue,
MUX_uxn_device_h_l90_c20_59f4_iffalse,
MUX_uxn_device_h_l90_c20_59f4_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_0507
BIN_OP_OR_uxn_device_h_l91_c21_0507 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_0507_left,
BIN_OP_OR_uxn_device_h_l91_c21_0507_right,
BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_0535
result_device_ram_address_MUX_uxn_device_h_l94_c3_0535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_0535
result_is_deo_done_MUX_uxn_device_h_l94_c3_0535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output);

-- MUX_uxn_device_h_l95_c32_14ce
MUX_uxn_device_h_l95_c32_14ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_14ce_cond,
MUX_uxn_device_h_l95_c32_14ce_iftrue,
MUX_uxn_device_h_l95_c32_14ce_iffalse,
MUX_uxn_device_h_l95_c32_14ce_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_80a8
BIN_OP_EQ_uxn_device_h_l101_c11_80a8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left,
BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right,
BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- is_auto_x_MUX_uxn_device_h_l101_c7_932d
is_auto_x_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond,
is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue,
is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse,
is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_932d
auto_advance_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_932d_cond,
auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output);

-- result_MUX_uxn_device_h_l101_c7_932d
result_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_932d_cond,
result_MUX_uxn_device_h_l101_c7_932d_iftrue,
result_MUX_uxn_device_h_l101_c7_932d_iffalse,
result_MUX_uxn_device_h_l101_c7_932d_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_932d
tmp8_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_932d_cond,
tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_932d_return_output);

-- is_auto_y_MUX_uxn_device_h_l101_c7_932d
is_auto_y_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond,
is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue,
is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse,
is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_932d
ctrl_mode_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_932d
ctrl_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_932d_cond,
ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_932d_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_932d
flip_x_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_932d_cond,
flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_932d_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_932d
flip_y_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_932d_cond,
flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_932d_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_932d
ram_addr_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_932d_cond,
ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output);

-- y_MUX_uxn_device_h_l101_c7_932d
y_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_932d_cond,
y_MUX_uxn_device_h_l101_c7_932d_iftrue,
y_MUX_uxn_device_h_l101_c7_932d_iffalse,
y_MUX_uxn_device_h_l101_c7_932d_return_output);

-- layer_MUX_uxn_device_h_l101_c7_932d
layer_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_932d_cond,
layer_MUX_uxn_device_h_l101_c7_932d_iftrue,
layer_MUX_uxn_device_h_l101_c7_932d_iffalse,
layer_MUX_uxn_device_h_l101_c7_932d_return_output);

-- color_MUX_uxn_device_h_l101_c7_932d
color_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_932d_cond,
color_MUX_uxn_device_h_l101_c7_932d_iftrue,
color_MUX_uxn_device_h_l101_c7_932d_iffalse,
color_MUX_uxn_device_h_l101_c7_932d_return_output);

-- x_MUX_uxn_device_h_l101_c7_932d
x_MUX_uxn_device_h_l101_c7_932d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_932d_cond,
x_MUX_uxn_device_h_l101_c7_932d_iftrue,
x_MUX_uxn_device_h_l101_c7_932d_iffalse,
x_MUX_uxn_device_h_l101_c7_932d_return_output);

-- BIN_OP_EQ_uxn_device_h_l104_c11_05e7
BIN_OP_EQ_uxn_device_h_l104_c11_05e7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left,
BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right,
BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- is_auto_x_MUX_uxn_device_h_l104_c7_13d7
is_auto_x_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond,
is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue,
is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse,
is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- auto_advance_MUX_uxn_device_h_l104_c7_13d7
auto_advance_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond,
auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue,
auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse,
auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- result_MUX_uxn_device_h_l104_c7_13d7
result_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l104_c7_13d7_cond,
result_MUX_uxn_device_h_l104_c7_13d7_iftrue,
result_MUX_uxn_device_h_l104_c7_13d7_iffalse,
result_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- tmp8_MUX_uxn_device_h_l104_c7_13d7
tmp8_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l104_c7_13d7_cond,
tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue,
tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse,
tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- is_auto_y_MUX_uxn_device_h_l104_c7_13d7
is_auto_y_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond,
is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue,
is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse,
is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- ctrl_mode_MUX_uxn_device_h_l104_c7_13d7
ctrl_mode_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond,
ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue,
ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse,
ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- ctrl_MUX_uxn_device_h_l104_c7_13d7
ctrl_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l104_c7_13d7_cond,
ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue,
ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse,
ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- flip_x_MUX_uxn_device_h_l104_c7_13d7
flip_x_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l104_c7_13d7_cond,
flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue,
flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse,
flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- flip_y_MUX_uxn_device_h_l104_c7_13d7
flip_y_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l104_c7_13d7_cond,
flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue,
flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse,
flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- ram_addr_MUX_uxn_device_h_l104_c7_13d7
ram_addr_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond,
ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue,
ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse,
ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- y_MUX_uxn_device_h_l104_c7_13d7
y_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l104_c7_13d7_cond,
y_MUX_uxn_device_h_l104_c7_13d7_iftrue,
y_MUX_uxn_device_h_l104_c7_13d7_iffalse,
y_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- layer_MUX_uxn_device_h_l104_c7_13d7
layer_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l104_c7_13d7_cond,
layer_MUX_uxn_device_h_l104_c7_13d7_iftrue,
layer_MUX_uxn_device_h_l104_c7_13d7_iffalse,
layer_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- color_MUX_uxn_device_h_l104_c7_13d7
color_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l104_c7_13d7_cond,
color_MUX_uxn_device_h_l104_c7_13d7_iftrue,
color_MUX_uxn_device_h_l104_c7_13d7_iffalse,
color_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- x_MUX_uxn_device_h_l104_c7_13d7
x_MUX_uxn_device_h_l104_c7_13d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l104_c7_13d7_cond,
x_MUX_uxn_device_h_l104_c7_13d7_iftrue,
x_MUX_uxn_device_h_l104_c7_13d7_iffalse,
x_MUX_uxn_device_h_l104_c7_13d7_return_output);

-- CONST_SR_7_uxn_device_h_l107_c25_ea24
CONST_SR_7_uxn_device_h_l107_c25_ea24 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l107_c25_ea24_x,
CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output);

-- CONST_SR_6_uxn_device_h_l108_c21_234d
CONST_SR_6_uxn_device_h_l108_c21_234d : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l108_c21_234d_x,
CONST_SR_6_uxn_device_h_l108_c21_234d_return_output);

-- CONST_SR_5_uxn_device_h_l109_c22_16fd
CONST_SR_5_uxn_device_h_l109_c22_16fd : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l109_c22_16fd_x,
CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output);

-- CONST_SR_4_uxn_device_h_l110_c22_dc54
CONST_SR_4_uxn_device_h_l110_c22_dc54 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l110_c22_dc54_x,
CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output);

-- BIN_OP_EQ_uxn_device_h_l113_c11_cfde
BIN_OP_EQ_uxn_device_h_l113_c11_cfde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left,
BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right,
BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- is_auto_x_MUX_uxn_device_h_l113_c7_7b59
is_auto_x_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond,
is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue,
is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse,
is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- auto_advance_MUX_uxn_device_h_l113_c7_7b59
auto_advance_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond,
auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue,
auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse,
auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- result_MUX_uxn_device_h_l113_c7_7b59
result_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l113_c7_7b59_cond,
result_MUX_uxn_device_h_l113_c7_7b59_iftrue,
result_MUX_uxn_device_h_l113_c7_7b59_iffalse,
result_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- tmp8_MUX_uxn_device_h_l113_c7_7b59
tmp8_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l113_c7_7b59_cond,
tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue,
tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse,
tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- is_auto_y_MUX_uxn_device_h_l113_c7_7b59
is_auto_y_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond,
is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue,
is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse,
is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- ram_addr_MUX_uxn_device_h_l113_c7_7b59
ram_addr_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond,
ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue,
ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse,
ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- y_MUX_uxn_device_h_l113_c7_7b59
y_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c7_7b59_cond,
y_MUX_uxn_device_h_l113_c7_7b59_iftrue,
y_MUX_uxn_device_h_l113_c7_7b59_iffalse,
y_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- x_MUX_uxn_device_h_l113_c7_7b59
x_MUX_uxn_device_h_l113_c7_7b59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l113_c7_7b59_cond,
x_MUX_uxn_device_h_l113_c7_7b59_iftrue,
x_MUX_uxn_device_h_l113_c7_7b59_iffalse,
x_MUX_uxn_device_h_l113_c7_7b59_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_8afc
BIN_OP_EQ_uxn_device_h_l117_c11_8afc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left,
BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right,
BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output);

-- is_auto_x_MUX_uxn_device_h_l117_c7_2f45
is_auto_x_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond,
is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue,
is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse,
is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_2f45
auto_advance_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond,
auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- result_MUX_uxn_device_h_l117_c7_2f45
result_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_2f45_cond,
result_MUX_uxn_device_h_l117_c7_2f45_iftrue,
result_MUX_uxn_device_h_l117_c7_2f45_iffalse,
result_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_2f45
tmp8_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_2f45_cond,
tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- is_auto_y_MUX_uxn_device_h_l117_c7_2f45
is_auto_y_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond,
is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue,
is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse,
is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_2f45
ram_addr_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond,
ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- y_MUX_uxn_device_h_l117_c7_2f45
y_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_2f45_cond,
y_MUX_uxn_device_h_l117_c7_2f45_iftrue,
y_MUX_uxn_device_h_l117_c7_2f45_iffalse,
y_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- x_MUX_uxn_device_h_l117_c7_2f45
x_MUX_uxn_device_h_l117_c7_2f45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_2f45_cond,
x_MUX_uxn_device_h_l117_c7_2f45_iftrue,
x_MUX_uxn_device_h_l117_c7_2f45_iffalse,
x_MUX_uxn_device_h_l117_c7_2f45_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb
result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- result_u8_value_MUX_uxn_device_h_l119_c3_88eb
result_u8_value_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond,
result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb
result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb
result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond,
result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb
result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- result_u16_addr_MUX_uxn_device_h_l119_c3_88eb
result_u16_addr_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond,
result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue,
result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse,
result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- tmp8_MUX_uxn_device_h_l119_c3_88eb
tmp8_MUX_uxn_device_h_l119_c3_88eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l119_c3_88eb_cond,
tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue,
tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse,
tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output);

-- BIN_OP_AND_uxn_device_h_l121_c11_5841
BIN_OP_AND_uxn_device_h_l121_c11_5841 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l121_c11_5841_left,
BIN_OP_AND_uxn_device_h_l121_c11_5841_right,
BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output);

-- BIN_OP_PLUS_uxn_device_h_l122_c23_952c
BIN_OP_PLUS_uxn_device_h_l122_c23_952c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left,
BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right,
BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32
result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output);

-- tmp8_MUX_uxn_device_h_l125_c4_7b32
tmp8_MUX_uxn_device_h_l125_c4_7b32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l125_c4_7b32_cond,
tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue,
tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse,
tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output);

-- MUX_uxn_device_h_l126_c13_0b30
MUX_uxn_device_h_l126_c13_0b30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c13_0b30_cond,
MUX_uxn_device_h_l126_c13_0b30_iftrue,
MUX_uxn_device_h_l126_c13_0b30_iffalse,
MUX_uxn_device_h_l126_c13_0b30_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c5_54cd
BIN_OP_OR_uxn_device_h_l126_c5_54cd : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c5_54cd_left,
BIN_OP_OR_uxn_device_h_l126_c5_54cd_right,
BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output);

-- MUX_uxn_device_h_l127_c13_dc8c
MUX_uxn_device_h_l127_c13_dc8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l127_c13_dc8c_cond,
MUX_uxn_device_h_l127_c13_dc8c_iftrue,
MUX_uxn_device_h_l127_c13_dc8c_iffalse,
MUX_uxn_device_h_l127_c13_dc8c_return_output);

-- BIN_OP_OR_uxn_device_h_l127_c5_5d5b
BIN_OP_OR_uxn_device_h_l127_c5_5d5b : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left,
BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right,
BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c11_c994
BIN_OP_EQ_uxn_device_h_l136_c11_c994 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c11_c994_left,
BIN_OP_EQ_uxn_device_h_l136_c11_c994_right,
BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output);

-- is_auto_x_MUX_uxn_device_h_l136_c7_f304
is_auto_x_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond,
is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue,
is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse,
is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output);

-- auto_advance_MUX_uxn_device_h_l136_c7_f304
auto_advance_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l136_c7_f304_cond,
auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue,
auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse,
auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output);

-- result_MUX_uxn_device_h_l136_c7_f304
result_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l136_c7_f304_cond,
result_MUX_uxn_device_h_l136_c7_f304_iftrue,
result_MUX_uxn_device_h_l136_c7_f304_iffalse,
result_MUX_uxn_device_h_l136_c7_f304_return_output);

-- is_auto_y_MUX_uxn_device_h_l136_c7_f304
is_auto_y_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond,
is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue,
is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse,
is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output);

-- ram_addr_MUX_uxn_device_h_l136_c7_f304
ram_addr_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l136_c7_f304_cond,
ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue,
ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse,
ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output);

-- y_MUX_uxn_device_h_l136_c7_f304
y_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c7_f304_cond,
y_MUX_uxn_device_h_l136_c7_f304_iftrue,
y_MUX_uxn_device_h_l136_c7_f304_iffalse,
y_MUX_uxn_device_h_l136_c7_f304_return_output);

-- x_MUX_uxn_device_h_l136_c7_f304
x_MUX_uxn_device_h_l136_c7_f304 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c7_f304_cond,
x_MUX_uxn_device_h_l136_c7_f304_iftrue,
x_MUX_uxn_device_h_l136_c7_f304_iffalse,
x_MUX_uxn_device_h_l136_c7_f304_return_output);

-- CONST_SR_1_uxn_device_h_l139_c15_5850
CONST_SR_1_uxn_device_h_l139_c15_5850 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l139_c15_5850_x,
CONST_SR_1_uxn_device_h_l139_c15_5850_return_output);

-- result_u8_value_MUX_uxn_device_h_l140_c3_0431
result_u8_value_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond,
result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_0431
result_device_ram_address_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l140_c3_0431
result_is_vram_write_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond,
result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_u16_addr_MUX_uxn_device_h_l140_c3_0431
result_u16_addr_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond,
result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_0431
result_is_deo_done_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output);

-- y_MUX_uxn_device_h_l140_c3_0431
y_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_0431_cond,
y_MUX_uxn_device_h_l140_c3_0431_iftrue,
y_MUX_uxn_device_h_l140_c3_0431_iffalse,
y_MUX_uxn_device_h_l140_c3_0431_return_output);

-- x_MUX_uxn_device_h_l140_c3_0431
x_MUX_uxn_device_h_l140_c3_0431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l140_c3_0431_cond,
x_MUX_uxn_device_h_l140_c3_0431_iftrue,
x_MUX_uxn_device_h_l140_c3_0431_iffalse,
x_MUX_uxn_device_h_l140_c3_0431_return_output);

-- result_u8_value_MUX_uxn_device_h_l144_c4_5352
result_u8_value_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond,
result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue,
result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse,
result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c4_5352
result_device_ram_address_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c4_5352
result_is_deo_done_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output);

-- y_MUX_uxn_device_h_l144_c4_5352
y_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l144_c4_5352_cond,
y_MUX_uxn_device_h_l144_c4_5352_iftrue,
y_MUX_uxn_device_h_l144_c4_5352_iffalse,
y_MUX_uxn_device_h_l144_c4_5352_return_output);

-- x_MUX_uxn_device_h_l144_c4_5352
x_MUX_uxn_device_h_l144_c4_5352 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l144_c4_5352_cond,
x_MUX_uxn_device_h_l144_c4_5352_iftrue,
x_MUX_uxn_device_h_l144_c4_5352_iffalse,
x_MUX_uxn_device_h_l144_c4_5352_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c5_5987
BIN_OP_PLUS_uxn_device_h_l145_c5_5987 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left,
BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right,
BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output);

-- CONST_SR_8_uxn_device_h_l148_c33_a010
CONST_SR_8_uxn_device_h_l148_c33_a010 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l148_c33_a010_x,
CONST_SR_8_uxn_device_h_l148_c33_a010_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c11_5ba0
result_u8_value_MUX_uxn_device_h_l149_c11_5ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond,
result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0
result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0
result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output);

-- y_MUX_uxn_device_h_l149_c11_5ba0
y_MUX_uxn_device_h_l149_c11_5ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l149_c11_5ba0_cond,
y_MUX_uxn_device_h_l149_c11_5ba0_iftrue,
y_MUX_uxn_device_h_l149_c11_5ba0_iffalse,
y_MUX_uxn_device_h_l149_c11_5ba0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c5_9a69
BIN_OP_PLUS_uxn_device_h_l150_c5_9a69 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left,
BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right,
BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output);

-- CONST_SR_8_uxn_device_h_l153_c33_581f
CONST_SR_8_uxn_device_h_l153_c33_581f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l153_c33_581f_x,
CONST_SR_8_uxn_device_h_l153_c33_581f_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c11_464d
BIN_OP_EQ_uxn_device_h_l161_c11_464d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c11_464d_left,
BIN_OP_EQ_uxn_device_h_l161_c11_464d_right,
BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output);

-- result_MUX_uxn_device_h_l161_c7_60aa
result_MUX_uxn_device_h_l161_c7_60aa : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c7_60aa_cond,
result_MUX_uxn_device_h_l161_c7_60aa_iftrue,
result_MUX_uxn_device_h_l161_c7_60aa_iffalse,
result_MUX_uxn_device_h_l161_c7_60aa_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c7_60aa
ram_addr_MUX_uxn_device_h_l161_c7_60aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond,
ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue,
ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse,
ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output);

-- y_MUX_uxn_device_h_l161_c7_60aa
y_MUX_uxn_device_h_l161_c7_60aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c7_60aa_cond,
y_MUX_uxn_device_h_l161_c7_60aa_iftrue,
y_MUX_uxn_device_h_l161_c7_60aa_iffalse,
y_MUX_uxn_device_h_l161_c7_60aa_return_output);

-- result_u8_value_MUX_uxn_device_h_l162_c3_6a43
result_u8_value_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond,
result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue,
result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse,
result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43
result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43
result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- ram_addr_MUX_uxn_device_h_l162_c3_6a43
ram_addr_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond,
ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue,
ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse,
ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- y_MUX_uxn_device_h_l162_c3_6a43
y_MUX_uxn_device_h_l162_c3_6a43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l162_c3_6a43_cond,
y_MUX_uxn_device_h_l162_c3_6a43_iftrue,
y_MUX_uxn_device_h_l162_c3_6a43_iffalse,
y_MUX_uxn_device_h_l162_c3_6a43_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_8360
result_u8_value_MUX_uxn_device_h_l163_c4_8360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_8360
result_device_ram_address_MUX_uxn_device_h_l163_c4_8360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_8360
result_is_deo_done_MUX_uxn_device_h_l163_c4_8360 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output);

-- y_MUX_uxn_device_h_l163_c4_8360
y_MUX_uxn_device_h_l163_c4_8360 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l163_c4_8360_cond,
y_MUX_uxn_device_h_l163_c4_8360_iftrue,
y_MUX_uxn_device_h_l163_c4_8360_iffalse,
y_MUX_uxn_device_h_l163_c4_8360_return_output);

-- UNARY_OP_NOT_uxn_device_h_l167_c27_0689
UNARY_OP_NOT_uxn_device_h_l167_c27_0689 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr,
UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output);

-- BIN_OP_PLUS_uxn_device_h_l169_c5_18c9
BIN_OP_PLUS_uxn_device_h_l169_c5_18c9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left,
BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right,
BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_0660
BIN_OP_EQ_uxn_device_h_l181_c11_0660 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_0660_left,
BIN_OP_EQ_uxn_device_h_l181_c11_0660_right,
BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output);

-- result_MUX_uxn_device_h_l181_c7_3470
result_MUX_uxn_device_h_l181_c7_3470 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_3470_cond,
result_MUX_uxn_device_h_l181_c7_3470_iftrue,
result_MUX_uxn_device_h_l181_c7_3470_iffalse,
result_MUX_uxn_device_h_l181_c7_3470_return_output);

-- ram_addr_MUX_uxn_device_h_l181_c7_3470
ram_addr_MUX_uxn_device_h_l181_c7_3470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l181_c7_3470_cond,
ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue,
ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse,
ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output);

-- result_u8_value_MUX_uxn_device_h_l182_c3_4936
result_u8_value_MUX_uxn_device_h_l182_c3_4936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond,
result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue,
result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse,
result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l182_c3_4936
result_device_ram_address_MUX_uxn_device_h_l182_c3_4936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond,
result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue,
result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse,
result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output);

-- ram_addr_MUX_uxn_device_h_l182_c3_4936
ram_addr_MUX_uxn_device_h_l182_c3_4936 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l182_c3_4936_cond,
ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue,
ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse,
ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output);

-- CONST_SR_8_uxn_device_h_l186_c32_72e5
CONST_SR_8_uxn_device_h_l186_c32_72e5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l186_c32_72e5_x,
CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c4_8b27
BIN_OP_OR_uxn_device_h_l189_c4_8b27 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c4_8b27_left,
BIN_OP_OR_uxn_device_h_l189_c4_8b27_right,
BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_c48a
BIN_OP_EQ_uxn_device_h_l192_c11_c48a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left,
BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right,
BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output);

-- result_MUX_uxn_device_h_l192_c7_506d
result_MUX_uxn_device_h_l192_c7_506d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_506d_cond,
result_MUX_uxn_device_h_l192_c7_506d_iftrue,
result_MUX_uxn_device_h_l192_c7_506d_iffalse,
result_MUX_uxn_device_h_l192_c7_506d_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_35ee
result_u8_value_MUX_uxn_device_h_l193_c3_35ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee
result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee
result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output);

-- result_MUX_uxn_device_h_l202_c3_5d3f
result_MUX_uxn_device_h_l202_c3_5d3f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l202_c3_5d3f_cond,
result_MUX_uxn_device_h_l202_c3_5d3f_iftrue,
result_MUX_uxn_device_h_l202_c3_5d3f_iffalse,
result_MUX_uxn_device_h_l202_c3_5d3f_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_3960
BIN_OP_MINUS_uxn_device_h_l203_c58_3960 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output);

-- screen_blit_uxn_device_h_l203_c46_b8ed
screen_blit_uxn_device_h_l203_c46_b8ed : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_b8ed_phase,
screen_blit_uxn_device_h_l203_c46_b8ed_ctrl,
screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance,
screen_blit_uxn_device_h_l203_c46_b8ed_x,
screen_blit_uxn_device_h_l203_c46_b8ed_y,
screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr,
screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_b8ed_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x,
CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output);



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
 BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 result_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 y_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 layer_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 color_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 x_MUX_uxn_device_h_l88_c2_d6e9_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output,
 MUX_uxn_device_h_l89_c19_59d5_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output,
 MUX_uxn_device_h_l90_c20_59f4_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output,
 MUX_uxn_device_h_l95_c32_14ce_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output,
 is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output,
 result_MUX_uxn_device_h_l101_c7_932d_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_932d_return_output,
 is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_932d_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_932d_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_932d_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output,
 y_MUX_uxn_device_h_l101_c7_932d_return_output,
 layer_MUX_uxn_device_h_l101_c7_932d_return_output,
 color_MUX_uxn_device_h_l101_c7_932d_return_output,
 x_MUX_uxn_device_h_l101_c7_932d_return_output,
 BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output,
 is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output,
 auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output,
 result_MUX_uxn_device_h_l104_c7_13d7_return_output,
 tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output,
 is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output,
 ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output,
 ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output,
 flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output,
 flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output,
 ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output,
 y_MUX_uxn_device_h_l104_c7_13d7_return_output,
 layer_MUX_uxn_device_h_l104_c7_13d7_return_output,
 color_MUX_uxn_device_h_l104_c7_13d7_return_output,
 x_MUX_uxn_device_h_l104_c7_13d7_return_output,
 CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output,
 CONST_SR_6_uxn_device_h_l108_c21_234d_return_output,
 CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output,
 CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output,
 BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output,
 is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output,
 auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output,
 result_MUX_uxn_device_h_l113_c7_7b59_return_output,
 tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output,
 is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output,
 ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output,
 y_MUX_uxn_device_h_l113_c7_7b59_return_output,
 x_MUX_uxn_device_h_l113_c7_7b59_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output,
 is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output,
 result_MUX_uxn_device_h_l117_c7_2f45_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output,
 is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output,
 y_MUX_uxn_device_h_l117_c7_2f45_return_output,
 x_MUX_uxn_device_h_l117_c7_2f45_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output,
 result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output,
 result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output,
 tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output,
 BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output,
 BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output,
 tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output,
 MUX_uxn_device_h_l126_c13_0b30_return_output,
 BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output,
 MUX_uxn_device_h_l127_c13_dc8c_return_output,
 BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output,
 is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output,
 auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output,
 result_MUX_uxn_device_h_l136_c7_f304_return_output,
 is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output,
 ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output,
 y_MUX_uxn_device_h_l136_c7_f304_return_output,
 x_MUX_uxn_device_h_l136_c7_f304_return_output,
 CONST_SR_1_uxn_device_h_l139_c15_5850_return_output,
 result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output,
 y_MUX_uxn_device_h_l140_c3_0431_return_output,
 x_MUX_uxn_device_h_l140_c3_0431_return_output,
 result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output,
 y_MUX_uxn_device_h_l144_c4_5352_return_output,
 x_MUX_uxn_device_h_l144_c4_5352_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output,
 CONST_SR_8_uxn_device_h_l148_c33_a010_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output,
 y_MUX_uxn_device_h_l149_c11_5ba0_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output,
 CONST_SR_8_uxn_device_h_l153_c33_581f_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output,
 result_MUX_uxn_device_h_l161_c7_60aa_return_output,
 ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output,
 y_MUX_uxn_device_h_l161_c7_60aa_return_output,
 result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output,
 ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output,
 y_MUX_uxn_device_h_l162_c3_6a43_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output,
 y_MUX_uxn_device_h_l163_c4_8360_return_output,
 UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output,
 BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output,
 result_MUX_uxn_device_h_l181_c7_3470_return_output,
 ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output,
 result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output,
 result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output,
 ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output,
 CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output,
 BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output,
 result_MUX_uxn_device_h_l192_c7_506d_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output,
 result_MUX_uxn_device_h_l202_c3_5d3f_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output,
 screen_blit_uxn_device_h_l203_c46_b8ed_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_d6e9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_932d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_d6e9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_932d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_d6e9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_d6e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_59d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_59d5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_59d5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_59d5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_59f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_59f4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_59f4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_59f4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_14ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_14ce_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_14ce_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_14ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_932d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_932d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_932d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_13d7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_932d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_932d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_13d7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_932d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l104_c7_13d7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_13d7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_13d7_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7b59_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_13d7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_13d7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7b59_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l104_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_ba3b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6a6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0d84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_289a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_6531_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l113_c7_7b59_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7b59_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7b59_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_2f45_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7b59_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7b59_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_2f45_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l113_c7_7b59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_2f45_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0254_uxn_device_h_l117_c7_2f45_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_2f45_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_f304_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_2f45_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_2f45_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_f304_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_2f45_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_832a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l122_c4_b4e8 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l121_c4_98c1 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output : unsigned(16 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_0b30_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_0b30_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_0b30_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c13_0b30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_dc8c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_dc8c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_dc8c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l127_c13_dc8c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_uxn_device_h_l138_c3_0987 : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_uxn_device_h_l137_c3_1ce3 : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l136_c7_f304_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c_uxn_device_h_l136_c7_f304_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_f304_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_60aa_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_uxn_device_h_l139_c3_e823 : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_60aa_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_f304_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_f304_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c7_f304_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_x : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_5d87 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_0431_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_5352_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_0431_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l140_c3_0431_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l143_c4_c846 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5ba0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_5352_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l145_c5_3fac : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_5352_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l144_c4_5352_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_b7d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l150_c5_a497 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l149_c11_5ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_8aa5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c7_60aa_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l161_c7_60aa_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_60aa_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_3470_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_60aa_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_60aa_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c7_60aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_6a43_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_8360_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_6a43_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l162_c3_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_8360_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_8360_iffalse : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l169_c5_2c9d : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l163_c4_8360_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_81f5_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_70d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_3470_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_3470_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_3470_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_506d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_bdb3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_506d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l192_c7_506d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_506d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_5d3f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_506d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_95bf_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_5d3f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l202_c3_5d3f_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_844b : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_2a50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_eba8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a94f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_9c17_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_5170_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_04c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_b0bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output : unsigned(0 downto 0);
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
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l89_c19_59d5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_right := to_unsigned(5, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right := to_unsigned(9, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l143_c4_c846 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse := VAR_result_u8_value_uxn_device_h_l143_c4_c846;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_14ce_iffalse := to_unsigned(47, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l126_c13_0b30_iffalse := to_unsigned(16, 8);
     VAR_result_u16_addr_uxn_device_h_l142_c4_5d87 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_5d87;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l95_c32_14ce_iftrue := to_unsigned(46, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue := to_unsigned(43, 8);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_832a := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_832a;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse := to_unsigned(43, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue := to_unsigned(40, 8);
     VAR_MUX_uxn_device_h_l127_c13_dc8c_iftrue := to_unsigned(4, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_right := to_unsigned(7, 8);
     VAR_MUX_uxn_device_h_l89_c19_59d5_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right := to_unsigned(3, 8);
     VAR_MUX_uxn_device_h_l126_c13_0b30_iftrue := to_unsigned(24, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l205_c4_844b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse := to_unsigned(45, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_right := to_unsigned(6, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l127_c13_dc8c_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right := to_unsigned(8, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l90_c20_59f4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l90_c20_59f4_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_932d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l104_c7_13d7_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l126_c13_0b30_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l127_c13_dc8c_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue := flip_y;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue := is_auto_x;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond := is_auto_x;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond := is_auto_x;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond := is_auto_x;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond := is_auto_x;
     VAR_y_MUX_uxn_device_h_l163_c4_8360_cond := is_auto_x;
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l140_c3_0431_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l162_c3_6a43_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l202_c3_5d3f_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_932d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_x := VAR_previous_device_ram_read;
     VAR_auto_advance_uxn_device_h_l137_c3_1ce3 := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iffalse := result;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left := x;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_932d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l104_c7_13d7_iftrue := x;
     VAR_x_MUX_uxn_device_h_l117_c7_2f45_iftrue := x;
     VAR_x_MUX_uxn_device_h_l136_c7_f304_iffalse := x;
     VAR_x_MUX_uxn_device_h_l140_c3_0431_iffalse := x;
     VAR_x_MUX_uxn_device_h_l144_c4_5352_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left := y;
     VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_x := y;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_932d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l104_c7_13d7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l113_c7_7b59_iftrue := y;
     VAR_y_MUX_uxn_device_h_l140_c3_0431_iffalse := y;
     VAR_y_MUX_uxn_device_h_l144_c4_5352_iftrue := y;
     VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iffalse := y;
     VAR_y_MUX_uxn_device_h_l161_c7_60aa_iffalse := y;
     VAR_y_MUX_uxn_device_h_l162_c3_6a43_iffalse := y;
     VAR_y_MUX_uxn_device_h_l163_c4_8360_iftrue := y;
     VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue := y;
     VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_x := VAR_auto_advance_uxn_device_h_l137_c3_1ce3;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_auto_advance_uxn_device_h_l137_c3_1ce3;
     VAR_is_auto_x_uxn_device_h_l138_c3_0987 := resize(VAR_auto_advance_uxn_device_h_l137_c3_1ce3, 1);
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_x_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     VAR_y_MUX_uxn_device_h_l144_c4_5352_cond := VAR_is_auto_x_uxn_device_h_l138_c3_0987;
     -- CAST_TO_uint4_t[uxn_device_h_l106_c11_ba3b] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_ba3b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l169_c5_18c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_left;
     BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output := BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_932d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_932d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l101_c11_80a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output := result.is_device_ram_write;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l119_c3_88eb] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_88eb_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_235c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_235c_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_235c_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;

     -- MUX[uxn_device_h_l126_c13_0b30] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c13_0b30_cond <= VAR_MUX_uxn_device_h_l126_c13_0b30_cond;
     MUX_uxn_device_h_l126_c13_0b30_iftrue <= VAR_MUX_uxn_device_h_l126_c13_0b30_iftrue;
     MUX_uxn_device_h_l126_c13_0b30_iffalse <= VAR_MUX_uxn_device_h_l126_c13_0b30_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c13_0b30_return_output := MUX_uxn_device_h_l126_c13_0b30_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l113_c7_7b59] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7b59_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- CAST_TO_uint8_t[uxn_device_h_l197_c22_95bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_95bf_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_SR_6[uxn_device_h_l108_c21_234d] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l108_c21_234d_x <= VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_return_output := CONST_SR_6_uxn_device_h_l108_c21_234d_return_output;

     -- CONST_SR_7[uxn_device_h_l107_c25_ea24] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l107_c25_ea24_x <= VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output := CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output;

     -- BIN_OP_EQ[uxn_device_h_l113_c11_cfde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_left;
     BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right <= VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output := BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;

     -- CONST_SR_5[uxn_device_h_l109_c22_16fd] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l109_c22_16fd_x <= VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output := CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l145_c5_5987] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_left;
     BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output := BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output;

     -- BIN_OP_EQ[uxn_device_h_l104_c11_05e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_left;
     BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right <= VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output := BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_ec82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l166_c23_81f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_81f5_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- UNARY_OP_NOT[uxn_device_h_l167_c27_0689] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output := UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output;

     -- CONST_SR_8[uxn_device_h_l186_c32_72e5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l186_c32_72e5_x <= VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output := CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c11_464d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c11_464d_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_left;
     BIN_OP_EQ_uxn_device_h_l161_c11_464d_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output := BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output := result.device_ram_address;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_8360] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output;

     -- CONST_SR_4[uxn_device_h_l110_c22_dc54] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l110_c22_dc54_x <= VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output := CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output := result.is_deo_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l104_c7_13d7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_13d7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l90_c20_997c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_997c_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_997c_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_8afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_0660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_0660_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_0660_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output;

     -- BIN_OP_AND[uxn_device_h_l121_c11_5841] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l121_c11_5841_left <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_left;
     BIN_OP_AND_uxn_device_h_l121_c11_5841_right <= VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output := BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_b0bc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_b0bc_return_output := result.u16_addr;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_3960] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_c48a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c11_c994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c11_c994_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_left;
     BIN_OP_EQ_uxn_device_h_l136_c11_c994_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output := BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;

     -- MUX[uxn_device_h_l127_c13_dc8c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l127_c13_dc8c_cond <= VAR_MUX_uxn_device_h_l127_c13_dc8c_cond;
     MUX_uxn_device_h_l127_c13_dc8c_iftrue <= VAR_MUX_uxn_device_h_l127_c13_dc8c_iftrue;
     MUX_uxn_device_h_l127_c13_dc8c_iffalse <= VAR_MUX_uxn_device_h_l127_c13_dc8c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l127_c13_dc8c_return_output := MUX_uxn_device_h_l127_c13_dc8c_return_output;

     -- CONST_SR_1[uxn_device_h_l139_c15_5850] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l139_c15_5850_x <= VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_return_output := CONST_SR_1_uxn_device_h_l139_c15_5850_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_04c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_04c8_return_output := result.is_vram_write;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_8360] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l150_c5_9a69] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_left;
     BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output := BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output := result.u8_value;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l121_c4_98c1 := resize(VAR_BIN_OP_AND_uxn_device_h_l121_c11_5841_return_output, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_80a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l104_c11_05e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_7b59_cond := VAR_BIN_OP_EQ_uxn_device_h_l113_c11_cfde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_2f45_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_8afc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_f304_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c11_c994_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_60aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_60aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c11_464d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_3470_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_0660_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_506d_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_c48a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_d6e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_235c_return_output;
     VAR_MUX_uxn_device_h_l89_c19_59d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_ec82_return_output;
     VAR_MUX_uxn_device_h_l90_c20_59f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_997c_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_3960_return_output;
     VAR_x_uxn_device_h_l145_c5_3fac := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c5_5987_return_output, 16);
     VAR_y_uxn_device_h_l150_c5_a497 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c5_9a69_return_output, 16);
     VAR_y_uxn_device_h_l169_c5_2c9d := resize(VAR_BIN_OP_PLUS_uxn_device_h_l169_c5_18c9_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7b59_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_2f45_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l177_l189_l118_l114_DUPLICATE_607f_return_output;
     VAR_color_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l106_c11_ba3b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l166_c23_81f5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c22_95bf_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_b0bc_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l119_l140_DUPLICATE_b0bc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l140_l119_l162_l125_l149_l193_l144_DUPLICATE_c080_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l182_l140_l193_l162_l149_DUPLICATE_d8a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_04c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l119_l140_DUPLICATE_04c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l182_l193_l162_l149_l94_DUPLICATE_0d70_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l182_l140_l193_l119_l162_DUPLICATE_e702_return_output;
     VAR_is_auto_y_uxn_device_h_l139_c3_e823 := resize(VAR_CONST_SR_1_uxn_device_h_l139_c15_5850_return_output, 1);
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_right := VAR_MUX_uxn_device_h_l126_c13_0b30_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right := VAR_MUX_uxn_device_h_l127_c13_dc8c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l167_c27_0689_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_932d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_932d_return_output;
     VAR_result_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l104_c7_13d7_return_output;
     VAR_result_MUX_uxn_device_h_l113_c7_7b59_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l113_c7_7b59_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_8360_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_8360_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l119_c3_88eb_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_y_MUX_uxn_device_h_l149_c11_5ba0_cond := VAR_is_auto_y_uxn_device_h_l139_c3_e823;
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_left := VAR_tmp8_uxn_device_h_l121_c4_98c1;
     VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse := VAR_tmp8_uxn_device_h_l121_c4_98c1;
     VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_x := VAR_x_uxn_device_h_l145_c5_3fac;
     VAR_x_MUX_uxn_device_h_l144_c4_5352_iftrue := VAR_x_uxn_device_h_l145_c5_3fac;
     VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_x := VAR_y_uxn_device_h_l150_c5_a497;
     VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iftrue := VAR_y_uxn_device_h_l150_c5_a497;
     VAR_y_MUX_uxn_device_h_l163_c4_8360_iffalse := VAR_y_uxn_device_h_l169_c5_2c9d;
     -- CAST_TO_uint1_t[uxn_device_h_l107_c15_6a6e] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6a6e_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l107_c25_ea24_return_output);

     -- result_u16_addr_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_cond;
     result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output := result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output := result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- auto_advance_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_cond;
     auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iftrue;
     auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output := auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- BIN_OP_OR[uxn_device_h_l126_c5_54cd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c5_54cd_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_left;
     BIN_OP_OR_uxn_device_h_l126_c5_54cd_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output := BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_35ee] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c4_8b27] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c4_8b27_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_left;
     BIN_OP_OR_uxn_device_h_l189_c4_8b27_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output := BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_cond;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output := result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c11_5ba0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l182_c3_4936] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output := result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output;

     -- y_MUX[uxn_device_h_l149_c11_5ba0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l149_c11_5ba0_cond <= VAR_y_MUX_uxn_device_h_l149_c11_5ba0_cond;
     y_MUX_uxn_device_h_l149_c11_5ba0_iftrue <= VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iftrue;
     y_MUX_uxn_device_h_l149_c11_5ba0_iffalse <= VAR_y_MUX_uxn_device_h_l149_c11_5ba0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l149_c11_5ba0_return_output := y_MUX_uxn_device_h_l149_c11_5ba0_return_output;

     -- ctrl_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_cond;
     ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output := ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_35ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output := CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output;

     -- x_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_x_MUX_uxn_device_h_l144_c4_5352_cond;
     x_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_x_MUX_uxn_device_h_l144_c4_5352_iftrue;
     x_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_x_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l144_c4_5352_return_output := x_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- CONST_SR_8[uxn_device_h_l153_c33_581f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l153_c33_581f_x <= VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_return_output := CONST_SR_8_uxn_device_h_l153_c33_581f_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l186_c22_bdb3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_bdb3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l186_c32_72e5_return_output);

     -- CONST_SR_8[uxn_device_h_l148_c33_a010] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l148_c33_a010_x <= VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_return_output := CONST_SR_8_uxn_device_h_l148_c33_a010_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_35ee] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l172_c23_70d0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_70d0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_y_uxn_device_h_l169_c5_2c9d);

     -- CAST_TO_uint1_t[uxn_device_h_l110_c12_6531] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_6531_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l110_c22_dc54_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l149_c11_5ba0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c11_5ba0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output;

     -- is_auto_x_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_cond;
     is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iftrue;
     is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output := is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c4_7b32] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_35ee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output;

     -- MUX[uxn_device_h_l89_c19_59d5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_59d5_cond <= VAR_MUX_uxn_device_h_l89_c19_59d5_cond;
     MUX_uxn_device_h_l89_c19_59d5_iftrue <= VAR_MUX_uxn_device_h_l89_c19_59d5_iftrue;
     MUX_uxn_device_h_l89_c19_59d5_iffalse <= VAR_MUX_uxn_device_h_l89_c19_59d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_59d5_return_output := MUX_uxn_device_h_l89_c19_59d5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_8360] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output;

     -- y_MUX[uxn_device_h_l163_c4_8360] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l163_c4_8360_cond <= VAR_y_MUX_uxn_device_h_l163_c4_8360_cond;
     y_MUX_uxn_device_h_l163_c4_8360_iftrue <= VAR_y_MUX_uxn_device_h_l163_c4_8360_iftrue;
     y_MUX_uxn_device_h_l163_c4_8360_iffalse <= VAR_y_MUX_uxn_device_h_l163_c4_8360_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l163_c4_8360_return_output := y_MUX_uxn_device_h_l163_c4_8360_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output := result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_cond;
     is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iftrue;
     is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output := is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l109_c12_289a] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_289a_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l109_c22_16fd_return_output);

     -- MUX[uxn_device_h_l90_c20_59f4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_59f4_cond <= VAR_MUX_uxn_device_h_l90_c20_59f4_cond;
     MUX_uxn_device_h_l90_c20_59f4_iftrue <= VAR_MUX_uxn_device_h_l90_c20_59f4_iftrue;
     MUX_uxn_device_h_l90_c20_59f4_iffalse <= VAR_MUX_uxn_device_h_l90_c20_59f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_59f4_return_output := MUX_uxn_device_h_l90_c20_59f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l182_c3_4936] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_cond;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output := result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output;

     -- color_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_color_MUX_uxn_device_h_l104_c7_13d7_cond;
     color_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_color_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     color_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_color_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l104_c7_13d7_return_output := color_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l108_c11_0d84] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0d84_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l108_c21_234d_return_output);

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left := VAR_BIN_OP_OR_uxn_device_h_l126_c5_54cd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse := VAR_BIN_OP_OR_uxn_device_h_l189_c4_8b27_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l107_c15_6a6e_return_output;
     VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l108_c11_0d84_return_output;
     VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l109_c12_289a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c12_6531_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse := VAR_CAST_TO_uint8_t_uxn_device_h_l172_c23_70d0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l186_c22_bdb3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l178_l122_DUPLICATE_4f7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_left := VAR_MUX_uxn_device_h_l89_c19_59d5_return_output;
     VAR_MUX_uxn_device_h_l95_c32_14ce_cond := VAR_MUX_uxn_device_h_l89_c19_59d5_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue := VAR_MUX_uxn_device_h_l89_c19_59d5_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_right := VAR_MUX_uxn_device_h_l90_c20_59f4_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue := VAR_MUX_uxn_device_h_l90_c20_59f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_auto_advance_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_color_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_ctrl_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c11_5ba0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c4_7b32_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c11_5ba0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_8360_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c11_5ba0_return_output;
     VAR_x_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_x_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_y_MUX_uxn_device_h_l144_c4_5352_iffalse := VAR_y_MUX_uxn_device_h_l149_c11_5ba0_return_output;
     VAR_y_MUX_uxn_device_h_l162_c3_6a43_iftrue := VAR_y_MUX_uxn_device_h_l163_c4_8360_return_output;
     -- y_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_y_MUX_uxn_device_h_l162_c3_6a43_cond;
     y_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_y_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     y_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_y_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l162_c3_6a43_return_output := y_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- result_u8_value_MUX[uxn_device_h_l163_c4_8360] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output;

     -- y_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_y_MUX_uxn_device_h_l144_c4_5352_cond;
     y_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_y_MUX_uxn_device_h_l144_c4_5352_iftrue;
     y_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_y_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l144_c4_5352_return_output := y_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- result_u8_value_MUX[uxn_device_h_l182_c3_4936] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_cond;
     result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iftrue;
     result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output := result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output;

     -- x_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_x_MUX_uxn_device_h_l140_c3_0431_cond;
     x_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_x_MUX_uxn_device_h_l140_c3_0431_iftrue;
     x_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_x_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l140_c3_0431_return_output := x_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_cond;
     ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output := ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output := auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- ram_addr_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_cond;
     ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output := ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- MUX[uxn_device_h_l95_c32_14ce] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_14ce_cond <= VAR_MUX_uxn_device_h_l95_c32_14ce_cond;
     MUX_uxn_device_h_l95_c32_14ce_iftrue <= VAR_MUX_uxn_device_h_l95_c32_14ce_iftrue;
     MUX_uxn_device_h_l95_c32_14ce_iffalse <= VAR_MUX_uxn_device_h_l95_c32_14ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_14ce_return_output := MUX_uxn_device_h_l95_c32_14ce_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l153_c23_8aa5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_8aa5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l153_c33_581f_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output := result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- ctrl_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_cond;
     ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_return_output := ctrl_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c21_0507] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_0507_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_left;
     BIN_OP_OR_uxn_device_h_l91_c21_0507_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output := BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output;

     -- is_auto_y_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_cond;
     is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output := is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- flip_x_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_cond;
     flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output := flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- layer_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_layer_MUX_uxn_device_h_l104_c7_13d7_cond;
     layer_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     layer_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_layer_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l104_c7_13d7_return_output := layer_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3[uxn_device_h_l192_c7_506d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l192_c7_506d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_36d3(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_35ee_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_35ee_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_35ee_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_35ee_return_output);

     -- BIN_OP_OR[uxn_device_h_l127_c5_5d5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_left;
     BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right <= VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output := BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- is_auto_x_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_cond;
     is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output := is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- ram_addr_MUX[uxn_device_h_l182_c3_4936] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l182_c3_4936_cond <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_cond;
     ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iftrue;
     ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output := ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l148_c23_b7d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_b7d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l148_c33_a010_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- flip_y_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_cond;
     flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output := flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- color_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_color_MUX_uxn_device_h_l101_c7_932d_cond;
     color_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_932d_iftrue;
     color_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_932d_return_output := color_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l122_c23_952c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_left;
     BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output := BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output;

     -- Submodule level 3
     VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue := VAR_BIN_OP_OR_uxn_device_h_l127_c5_5d5b_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_0507_return_output;
     VAR_result_u16_addr_uxn_device_h_l122_c4_b4e8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l122_c23_952c_return_output, 16);
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l148_c23_b7d9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l153_c23_8aa5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue := VAR_MUX_uxn_device_h_l95_c32_14ce_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_flip_x_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_flip_y_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l117_c7_2f45_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_layer_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue := VAR_ram_addr_MUX_uxn_device_h_l162_c3_6a43_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue := VAR_ram_addr_MUX_uxn_device_h_l182_c3_4936_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_506d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l192_c7_506d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_8360_return_output;
     VAR_x_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_x_MUX_uxn_device_h_l140_c3_0431_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_y_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_y_MUX_uxn_device_h_l161_c7_60aa_iftrue := VAR_y_MUX_uxn_device_h_l162_c3_6a43_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue := VAR_result_u16_addr_uxn_device_h_l122_c4_b4e8;
     -- auto_advance_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_cond;
     auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output := auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c11_5ba0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_cond;
     result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output := result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_0535] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_cond;
     ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output := ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_cond;
     flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_return_output := flip_x_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_932d_cond;
     layer_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_932d_iftrue;
     layer_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_932d_return_output := layer_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- tmp8_MUX[uxn_device_h_l125_c4_7b32] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l125_c4_7b32_cond <= VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_cond;
     tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue <= VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iftrue;
     tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse <= VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output := tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output := result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_0535] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- color_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_color_MUX_uxn_device_h_l88_c2_d6e9_cond;
     color_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     color_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_d6e9_return_output := color_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- y_MUX[uxn_device_h_l161_c7_60aa] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c7_60aa_cond <= VAR_y_MUX_uxn_device_h_l161_c7_60aa_cond;
     y_MUX_uxn_device_h_l161_c7_60aa_iftrue <= VAR_y_MUX_uxn_device_h_l161_c7_60aa_iftrue;
     y_MUX_uxn_device_h_l161_c7_60aa_iffalse <= VAR_y_MUX_uxn_device_h_l161_c7_60aa_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c7_60aa_return_output := y_MUX_uxn_device_h_l161_c7_60aa_return_output;

     -- y_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_y_MUX_uxn_device_h_l140_c3_0431_cond;
     y_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_0431_iftrue;
     y_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_0431_return_output := y_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- is_auto_y_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_cond;
     is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output := is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- is_auto_x_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_cond;
     is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output := is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_cond;
     flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_return_output := flip_y_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- x_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_x_MUX_uxn_device_h_l136_c7_f304_cond;
     x_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_x_MUX_uxn_device_h_l136_c7_f304_iftrue;
     x_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_x_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c7_f304_return_output := x_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- ram_addr_MUX[uxn_device_h_l181_c7_3470] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l181_c7_3470_cond <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_cond;
     ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iftrue;
     ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output := ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output := result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- result_u8_value_MUX[uxn_device_h_l162_c3_6a43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_cond;
     result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iftrue;
     result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output := result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef[uxn_device_h_l181_c7_3470] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_3470_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4bef(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l182_c3_4936_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l182_c3_4936_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l182_c3_4936_return_output);

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l113_c7_7b59_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l113_c7_7b59_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l113_c7_7b59_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l113_c7_7b59_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse := VAR_ram_addr_MUX_uxn_device_h_l181_c7_3470_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_3470_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4bef_uxn_device_h_l181_c7_3470_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c11_5ba0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output;
     VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue := VAR_tmp8_MUX_uxn_device_h_l125_c4_7b32_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_x_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_0431_return_output;
     VAR_y_MUX_uxn_device_h_l136_c7_f304_iffalse := VAR_y_MUX_uxn_device_h_l161_c7_60aa_return_output;
     -- y_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_y_MUX_uxn_device_h_l136_c7_f304_cond;
     y_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_y_MUX_uxn_device_h_l136_c7_f304_iftrue;
     y_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_y_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c7_f304_return_output := y_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- tmp8_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_cond;
     tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output := tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- is_auto_x_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_cond;
     is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output := is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- layer_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_cond;
     layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_return_output := layer_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l88_c2_d6e9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_d6e9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_0535_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_0535_return_output);

     -- flip_x_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_cond;
     flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output := flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3[uxn_device_h_l161_c7_60aa] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l161_c7_60aa_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_36d3(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l162_c3_6a43_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c3_6a43_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c3_6a43_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c3_6a43_return_output);

     -- ram_addr_MUX[uxn_device_h_l161_c7_60aa] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_cond;
     ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output := ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output;

     -- x_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_x_MUX_uxn_device_h_l117_c7_2f45_cond;
     x_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     x_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_2f45_return_output := x_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- auto_advance_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_cond;
     auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output := auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l119_c3_88eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_cond;
     result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iftrue;
     result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output := result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_cond;
     flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output := flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l144_c4_5352] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_cond;
     result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iftrue;
     result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output := result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output;

     -- is_auto_y_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_cond;
     is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output := is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l104_c7_13d7_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l104_c7_13d7_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse := VAR_ram_addr_MUX_uxn_device_h_l161_c7_60aa_return_output;
     VAR_result_MUX_uxn_device_h_l161_c7_60aa_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_36d3_uxn_device_h_l161_c7_60aa_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l144_c4_5352_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue := VAR_tmp8_MUX_uxn_device_h_l119_c3_88eb_return_output;
     VAR_x_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_y_MUX_uxn_device_h_l136_c7_f304_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- result_u8_value_MUX[uxn_device_h_l140_c3_0431] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_cond;
     result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iftrue;
     result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output := result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_cond;
     tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output := tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- ram_addr_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_cond;
     ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iftrue;
     ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output := ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- y_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_y_MUX_uxn_device_h_l117_c7_2f45_cond;
     y_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     y_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_2f45_return_output := y_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- is_auto_x_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_cond;
     is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iftrue;
     is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output := is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- x_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_x_MUX_uxn_device_h_l113_c7_7b59_cond;
     x_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_x_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     x_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_x_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l113_c7_7b59_return_output := x_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- is_auto_y_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_cond;
     is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iftrue;
     is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output := is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output := auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0254[uxn_device_h_l117_c7_2f45] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0254_uxn_device_h_l117_c7_2f45_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_0254(
     result,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l119_c3_88eb_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l119_c3_88eb_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_88eb_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l119_c3_88eb_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_88eb_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l119_c3_88eb_return_output);

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_ram_addr_MUX_uxn_device_h_l136_c7_f304_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_2f45_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0254_uxn_device_h_l117_c7_2f45_return_output;
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_x_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_x_MUX_uxn_device_h_l113_c7_7b59_return_output;
     VAR_y_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_2f45_return_output;
     -- x_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_x_MUX_uxn_device_h_l104_c7_13d7_cond;
     x_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_x_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     x_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_x_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l104_c7_13d7_return_output := x_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- tmp8_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_cond;
     tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output := tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output := ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- is_auto_x_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_cond;
     is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output := is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c7_60aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output;

     -- y_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_y_MUX_uxn_device_h_l113_c7_7b59_cond;
     y_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_y_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     y_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_y_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c7_7b59_return_output := y_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- auto_advance_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output := auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- is_auto_y_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_cond;
     is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output := is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c[uxn_device_h_l136_c7_f304] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c_uxn_device_h_l136_c7_f304_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l140_c3_0431_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_0431_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l140_c3_0431_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l140_c3_0431_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l140_c3_0431_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_0431_return_output);

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c7_60aa_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_2f45_return_output;
     VAR_result_MUX_uxn_device_h_l136_c7_f304_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ed8c_uxn_device_h_l136_c7_f304_return_output;
     VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_tmp8_MUX_uxn_device_h_l113_c7_7b59_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_x_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_y_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_y_MUX_uxn_device_h_l113_c7_7b59_return_output;
     -- ram_addr_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_cond;
     ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output := ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l181_c7_3470] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output;

     -- tmp8_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_cond;
     tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output := tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- y_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_y_MUX_uxn_device_h_l104_c7_13d7_cond;
     y_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_y_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     y_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_y_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l104_c7_13d7_return_output := y_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- x_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_x_MUX_uxn_device_h_l101_c7_932d_cond;
     x_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_932d_iftrue;
     x_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_932d_return_output := x_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l181_c7_3470_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_ram_addr_MUX_uxn_device_h_l113_c7_7b59_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_tmp8_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_932d_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_y_MUX_uxn_device_h_l104_c7_13d7_return_output;
     -- tmp8_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_cond;
     tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_return_output := tmp8_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- y_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_y_MUX_uxn_device_h_l101_c7_932d_cond;
     y_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_932d_iftrue;
     y_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_932d_return_output := y_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- ram_addr_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_cond;
     ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output := ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- x_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_x_MUX_uxn_device_h_l88_c2_d6e9_cond;
     x_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     x_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_d6e9_return_output := x_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_506d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_506d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l104_c7_13d7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_932d_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_932d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_6f5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_cond;
     tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output := tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- y_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_y_MUX_uxn_device_h_l88_c2_d6e9_cond;
     y_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     y_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_d6e9_return_output := y_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output := ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_6f5b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_932d_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     -- ram_addr_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output := ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_0a47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output;

     -- Submodule level 11
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_0a47_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     -- screen_blit[uxn_device_h_l203_c46_b8ed] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_b8ed_phase <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_phase;
     screen_blit_uxn_device_h_l203_c46_b8ed_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ctrl;
     screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_auto_advance;
     screen_blit_uxn_device_h_l203_c46_b8ed_x <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_x;
     screen_blit_uxn_device_h_l203_c46_b8ed_y <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_y;
     screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_ram_addr;
     screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_b8ed_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output := screen_blit_uxn_device_h_l203_c46_b8ed_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_a94f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a94f_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_9c17] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_9c17_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_2a50] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_2a50_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l210_c25_5170] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_5170_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output.is_blit_done;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l207_c22_eba8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_eba8_return_output := VAR_screen_blit_uxn_device_h_l203_c46_b8ed_return_output.u16_addr;

     -- Submodule level 13
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l202_c3_5d3f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_5d3f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l205_c4_844b,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_2a50_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l207_c22_eba8_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a94f_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_9c17_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l210_c25_5170_return_output);

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l202_c3_5d3f_return_output;
     -- result_MUX[uxn_device_h_l202_c3_5d3f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l202_c3_5d3f_cond <= VAR_result_MUX_uxn_device_h_l202_c3_5d3f_cond;
     result_MUX_uxn_device_h_l202_c3_5d3f_iftrue <= VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iftrue;
     result_MUX_uxn_device_h_l202_c3_5d3f_iffalse <= VAR_result_MUX_uxn_device_h_l202_c3_5d3f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l202_c3_5d3f_return_output := result_MUX_uxn_device_h_l202_c3_5d3f_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l192_c7_506d_iffalse := VAR_result_MUX_uxn_device_h_l202_c3_5d3f_return_output;
     -- result_MUX[uxn_device_h_l192_c7_506d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_506d_cond <= VAR_result_MUX_uxn_device_h_l192_c7_506d_cond;
     result_MUX_uxn_device_h_l192_c7_506d_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_506d_iftrue;
     result_MUX_uxn_device_h_l192_c7_506d_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_506d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_506d_return_output := result_MUX_uxn_device_h_l192_c7_506d_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l181_c7_3470_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_506d_return_output;
     -- result_MUX[uxn_device_h_l181_c7_3470] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_3470_cond <= VAR_result_MUX_uxn_device_h_l181_c7_3470_cond;
     result_MUX_uxn_device_h_l181_c7_3470_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_3470_iftrue;
     result_MUX_uxn_device_h_l181_c7_3470_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_3470_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_3470_return_output := result_MUX_uxn_device_h_l181_c7_3470_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l161_c7_60aa_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_3470_return_output;
     -- result_MUX[uxn_device_h_l161_c7_60aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c7_60aa_cond <= VAR_result_MUX_uxn_device_h_l161_c7_60aa_cond;
     result_MUX_uxn_device_h_l161_c7_60aa_iftrue <= VAR_result_MUX_uxn_device_h_l161_c7_60aa_iftrue;
     result_MUX_uxn_device_h_l161_c7_60aa_iffalse <= VAR_result_MUX_uxn_device_h_l161_c7_60aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c7_60aa_return_output := result_MUX_uxn_device_h_l161_c7_60aa_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l136_c7_f304_iffalse := VAR_result_MUX_uxn_device_h_l161_c7_60aa_return_output;
     -- result_MUX[uxn_device_h_l136_c7_f304] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l136_c7_f304_cond <= VAR_result_MUX_uxn_device_h_l136_c7_f304_cond;
     result_MUX_uxn_device_h_l136_c7_f304_iftrue <= VAR_result_MUX_uxn_device_h_l136_c7_f304_iftrue;
     result_MUX_uxn_device_h_l136_c7_f304_iffalse <= VAR_result_MUX_uxn_device_h_l136_c7_f304_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l136_c7_f304_return_output := result_MUX_uxn_device_h_l136_c7_f304_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l117_c7_2f45_iffalse := VAR_result_MUX_uxn_device_h_l136_c7_f304_return_output;
     -- result_MUX[uxn_device_h_l117_c7_2f45] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_2f45_cond <= VAR_result_MUX_uxn_device_h_l117_c7_2f45_cond;
     result_MUX_uxn_device_h_l117_c7_2f45_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_2f45_iftrue;
     result_MUX_uxn_device_h_l117_c7_2f45_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_2f45_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_2f45_return_output := result_MUX_uxn_device_h_l117_c7_2f45_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l113_c7_7b59_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_2f45_return_output;
     -- result_MUX[uxn_device_h_l113_c7_7b59] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l113_c7_7b59_cond <= VAR_result_MUX_uxn_device_h_l113_c7_7b59_cond;
     result_MUX_uxn_device_h_l113_c7_7b59_iftrue <= VAR_result_MUX_uxn_device_h_l113_c7_7b59_iftrue;
     result_MUX_uxn_device_h_l113_c7_7b59_iffalse <= VAR_result_MUX_uxn_device_h_l113_c7_7b59_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l113_c7_7b59_return_output := result_MUX_uxn_device_h_l113_c7_7b59_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l104_c7_13d7_iffalse := VAR_result_MUX_uxn_device_h_l113_c7_7b59_return_output;
     -- result_MUX[uxn_device_h_l104_c7_13d7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l104_c7_13d7_cond <= VAR_result_MUX_uxn_device_h_l104_c7_13d7_cond;
     result_MUX_uxn_device_h_l104_c7_13d7_iftrue <= VAR_result_MUX_uxn_device_h_l104_c7_13d7_iftrue;
     result_MUX_uxn_device_h_l104_c7_13d7_iffalse <= VAR_result_MUX_uxn_device_h_l104_c7_13d7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l104_c7_13d7_return_output := result_MUX_uxn_device_h_l104_c7_13d7_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l101_c7_932d_iffalse := VAR_result_MUX_uxn_device_h_l104_c7_13d7_return_output;
     -- result_MUX[uxn_device_h_l101_c7_932d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_932d_cond <= VAR_result_MUX_uxn_device_h_l101_c7_932d_cond;
     result_MUX_uxn_device_h_l101_c7_932d_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_932d_iftrue;
     result_MUX_uxn_device_h_l101_c7_932d_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_932d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_932d_return_output := result_MUX_uxn_device_h_l101_c7_932d_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_932d_return_output;
     -- result_MUX[uxn_device_h_l88_c2_d6e9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_d6e9_cond <= VAR_result_MUX_uxn_device_h_l88_c2_d6e9_cond;
     result_MUX_uxn_device_h_l88_c2_d6e9_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iftrue;
     result_MUX_uxn_device_h_l88_c2_d6e9_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_d6e9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_d6e9_return_output := result_MUX_uxn_device_h_l88_c2_d6e9_return_output;

     -- Submodule level 24
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_d6e9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_d6e9_return_output;
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
