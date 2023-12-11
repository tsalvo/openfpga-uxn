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
entity screen_deo_0CLK_e5bc6db3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_e5bc6db3;
architecture arch of screen_deo_0CLK_e5bc6db3 is
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
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l88_c6_dd25]
signal BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_6912]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l88_c2_280e]
signal ctrl_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l88_c2_280e]
signal flip_x_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l88_c2_280e]
signal is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l88_c2_280e]
signal y_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l88_c2_280e]
signal flip_y_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l88_c2_280e]
signal layer_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l88_c2_280e]
signal is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l88_c2_280e]
signal x_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l88_c2_280e]
signal auto_advance_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l88_c2_280e]
signal color_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l88_c2_280e]
signal ram_addr_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l88_c2_280e]
signal tmp8_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l88_c2_280e]
signal result_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l88_c2_280e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_280e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l88_c2_280e_return_output : device_out_result_t;

-- ctrl_mode_MUX[uxn_device_h_l88_c2_280e]
signal ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l88_c2_280e]
signal is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c19_c0f2]
signal BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l89_c19_78f4]
signal MUX_uxn_device_h_l89_c19_78f4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_78f4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_78f4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l89_c19_78f4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c20_a2b3]
signal BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l90_c20_c77f]
signal MUX_uxn_device_h_l90_c20_c77f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_c77f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_c77f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l90_c20_c77f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c21_9c37]
signal BIN_OP_OR_uxn_device_h_l91_c21_9c37_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_9c37_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l94_c3_b041]
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l94_c3_b041]
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l95_c32_6ab6]
signal MUX_uxn_device_h_l95_c32_6ab6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c32_6ab6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_6ab6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l95_c32_6ab6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_4eac]
signal BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_2b07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l101_c7_6912]
signal ctrl_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l101_c7_6912]
signal flip_x_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_6912]
signal y_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l101_c7_6912]
signal flip_y_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l101_c7_6912]
signal layer_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l101_c7_6912]
signal x_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_6912]
signal auto_advance_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l101_c7_6912]
signal color_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l101_c7_6912]
signal ram_addr_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l101_c7_6912]
signal tmp8_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l101_c7_6912]
signal result_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l101_c7_6912_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_6912_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l101_c7_6912_return_output : device_out_result_t;

-- ctrl_mode_MUX[uxn_device_h_l101_c7_6912]
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_88cd]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_a1d2]
signal BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_db9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l106_c7_2b07]
signal ctrl_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l106_c7_2b07]
signal flip_x_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l106_c7_2b07]
signal y_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l106_c7_2b07]
signal flip_y_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l106_c7_2b07]
signal layer_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l106_c7_2b07]
signal x_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_2b07]
signal auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l106_c7_2b07]
signal color_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l106_c7_2b07]
signal ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l106_c7_2b07]
signal tmp8_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l106_c7_2b07]
signal result_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l106_c7_2b07_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l106_c7_2b07_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l106_c7_2b07_return_output : device_out_result_t;

-- ctrl_mode_MUX[uxn_device_h_l106_c7_2b07]
signal ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l107_c3_aae2]
signal ctrl_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l107_c3_aae2]
signal flip_x_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l107_c3_aae2]
signal flip_y_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l107_c3_aae2]
signal layer_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l107_c3_aae2]
signal color_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_aae2]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l107_c3_aae2]
signal ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l110_c26_86c8]
signal CONST_SR_7_uxn_device_h_l110_c26_86c8_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l111_c22_51c1]
signal CONST_SR_6_uxn_device_h_l111_c22_51c1_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l112_c23_7aa4]
signal CONST_SR_5_uxn_device_h_l112_c23_7aa4_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l113_c23_cf55]
signal CONST_SR_4_uxn_device_h_l113_c23_cf55_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c11_ced0]
signal BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_cfd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l117_c7_db9a]
signal y_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l117_c7_db9a]
signal x_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l117_c7_db9a]
signal auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l117_c7_db9a]
signal ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l117_c7_db9a]
signal tmp8_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l117_c7_db9a]
signal result_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l117_c7_db9a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_db9a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l117_c7_db9a_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l118_c3_c752]
signal x_MUX_uxn_device_h_l118_c3_c752_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l118_c3_c752_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c3_c752_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c3_c752_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l118_c3_c752]
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_f835]
signal BIN_OP_EQ_uxn_device_h_l124_c11_f835_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_f835_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_92a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c7_cfd2]
signal y_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l124_c7_cfd2]
signal x_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_cfd2]
signal auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l124_c7_cfd2]
signal ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l124_c7_cfd2]
signal tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l124_c7_cfd2]
signal result_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l124_c7_cfd2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l124_c7_cfd2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l124_c7_cfd2_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l125_c3_e355]
signal x_MUX_uxn_device_h_l125_c3_e355_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c3_e355_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c3_e355_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c3_e355_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_e355]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l126_c4_d2c8]
signal BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_a899]
signal BIN_OP_EQ_uxn_device_h_l130_c11_a899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_a899_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_50c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l130_c7_92a9]
signal y_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l130_c7_92a9]
signal x_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_92a9]
signal auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l130_c7_92a9]
signal ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l130_c7_92a9]
signal tmp8_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l130_c7_92a9]
signal result_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l130_c7_92a9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l130_c7_92a9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l130_c7_92a9_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l131_c3_71ca]
signal y_MUX_uxn_device_h_l131_c3_71ca_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l131_c3_71ca_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c3_71ca_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c3_71ca_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_71ca]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_c693]
signal BIN_OP_EQ_uxn_device_h_l137_c11_c693_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_c693_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l157_c7_0486]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l137_c7_50c4]
signal y_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l137_c7_50c4]
signal x_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_50c4]
signal auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l137_c7_50c4]
signal ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l137_c7_50c4]
signal tmp8_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l137_c7_50c4]
signal result_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l137_c7_50c4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l137_c7_50c4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l137_c7_50c4_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l138_c3_abd8]
signal y_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l138_c3_abd8]
signal tmp8_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l138_c3_abd8]
signal result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l138_c3_abd8]
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l138_c3_abd8]
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_abd8]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l138_c3_abd8]
signal result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l141_c11_07e7]
signal BIN_OP_AND_uxn_device_h_l141_c11_07e7_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l141_c11_07e7_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output : unsigned(3 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l142_c23_c746]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l142_c23_a6ca]
signal BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output : unsigned(32 downto 0);

-- tmp8_MUX[uxn_device_h_l145_c4_48f4]
signal tmp8_MUX_uxn_device_h_l145_c4_48f4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l146_c13_2eb4]
signal MUX_uxn_device_h_l146_c13_2eb4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l146_c13_2eb4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l146_c13_2eb4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l146_c13_2eb4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l146_c5_aa77]
signal BIN_OP_OR_uxn_device_h_l146_c5_aa77_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c5_aa77_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l147_c13_164e]
signal MUX_uxn_device_h_l147_c13_164e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c13_164e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c13_164e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c13_164e_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c5_0cc4]
signal BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l152_c8_7f1e]
signal y_MUX_uxn_device_h_l152_c8_7f1e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7f1e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7f1e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c8_7f1e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c8_7f1e]
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l157_c11_834a]
signal BIN_OP_EQ_uxn_device_h_l157_c11_834a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l157_c11_834a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_b689]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l157_c7_0486]
signal x_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l157_c7_0486]
signal auto_advance_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l157_c7_0486]
signal ram_addr_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l157_c7_0486]
signal result_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l157_c7_0486_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l157_c7_0486_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l157_c7_0486_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l158_c3_dde8]
signal x_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l158_c3_dde8]
signal auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l158_c3_dde8]
signal result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l158_c3_dde8]
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l158_c3_dde8]
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l158_c3_dde8]
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l158_c3_dde8]
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l158_c3_dde8]
signal result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l163_c9_0691]
signal UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l163_c4_4950]
signal x_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l163_c4_4950]
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l163_c4_4950]
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_4950]
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l163_c4_4950]
signal result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c9_6e31]
signal BIN_OP_AND_uxn_device_h_l164_c9_6e31_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c9_6e31_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l164_c9_8b71]
signal BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l164_c5_ad6d]
signal x_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l164_c5_ad6d]
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l164_c5_ad6d]
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l164_c5_ad6d]
signal result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c6_5396]
signal BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l168_c34_7905]
signal CONST_SR_8_uxn_device_h_l168_c34_7905_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l168_c34_7905_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l174_c8_b432]
signal auto_advance_MUX_uxn_device_h_l174_c8_b432_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l174_c8_b432]
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c11_1e62]
signal BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_1b7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l179_c7_b689]
signal ram_addr_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l179_c7_b689]
signal result_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l179_c7_b689_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_b689_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l179_c7_b689_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l180_c3_27ef]
signal ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c3_27ef]
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_27ef]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c3_27ef]
signal result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c8_eb03]
signal BIN_OP_AND_uxn_device_h_l181_c8_eb03_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c8_eb03_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l181_c8_a1e4]
signal BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c4_a06a]
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_a06a]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c4_a06a]
signal result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l187_c8_f3ed]
signal ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l192_c11_8ee8]
signal BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_3177]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l192_c7_1b7a]
signal ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l192_c7_1b7a]
signal result_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l192_c7_1b7a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_1b7a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l192_c7_1b7a_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l193_c3_bcf4]
signal ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l193_c3_bcf4]
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_bcf4]
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l193_c3_bcf4]
signal result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l194_c9_6a74]
signal BIN_OP_AND_uxn_device_h_l194_c9_6a74_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c9_6a74_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l194_c9_4f65]
signal BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l194_c4_7d02]
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l194_c4_7d02]
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l194_c4_7d02]
signal result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l197_c33_c05f]
signal CONST_SR_8_uxn_device_h_l197_c33_c05f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l200_c8_d330]
signal ram_addr_MUX_uxn_device_h_l200_c8_d330_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l201_c4_abbd]
signal BIN_OP_OR_uxn_device_h_l201_c4_abbd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c4_abbd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l204_c11_82d2]
signal BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l213_c1_aefd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l204_c7_3177]
signal result_MUX_uxn_device_h_l204_c7_3177_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l204_c7_3177_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_3177_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_3177_return_output : device_out_result_t;

-- result_device_ram_address_MUX[uxn_device_h_l205_c3_bfbe]
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l205_c3_bfbe]
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l205_c3_bfbe]
signal result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l206_c9_6059]
signal BIN_OP_AND_uxn_device_h_l206_c9_6059_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c9_6059_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l206_c9_9927]
signal BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l206_c4_e376]
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l206_c4_e376]
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l206_c4_e376]
signal result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_b547]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l214_c3_d953]
signal result_MUX_uxn_device_h_l214_c3_d953_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l214_c3_d953_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c3_d953_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l214_c3_d953_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l215_c58_8e8d]
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l215_c46_fae6]
signal screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l215_c46_fae6_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957
signal CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1
signal CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_8b26( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u16_addr := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.u8_value := ref_toks_5;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_53a4( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.u8_value := ref_toks_6;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_d321( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;

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
-- BIN_OP_EQ_uxn_device_h_l88_c6_dd25
BIN_OP_EQ_uxn_device_h_l88_c6_dd25 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left,
BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right,
BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output);

-- ctrl_MUX_uxn_device_h_l88_c2_280e
ctrl_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l88_c2_280e_cond,
ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue,
ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse,
ctrl_MUX_uxn_device_h_l88_c2_280e_return_output);

-- flip_x_MUX_uxn_device_h_l88_c2_280e
flip_x_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l88_c2_280e_cond,
flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue,
flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse,
flip_x_MUX_uxn_device_h_l88_c2_280e_return_output);

-- is_sprite_port_MUX_uxn_device_h_l88_c2_280e
is_sprite_port_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond,
is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue,
is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse,
is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output);

-- y_MUX_uxn_device_h_l88_c2_280e
y_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l88_c2_280e_cond,
y_MUX_uxn_device_h_l88_c2_280e_iftrue,
y_MUX_uxn_device_h_l88_c2_280e_iffalse,
y_MUX_uxn_device_h_l88_c2_280e_return_output);

-- flip_y_MUX_uxn_device_h_l88_c2_280e
flip_y_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l88_c2_280e_cond,
flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue,
flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse,
flip_y_MUX_uxn_device_h_l88_c2_280e_return_output);

-- layer_MUX_uxn_device_h_l88_c2_280e
layer_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l88_c2_280e_cond,
layer_MUX_uxn_device_h_l88_c2_280e_iftrue,
layer_MUX_uxn_device_h_l88_c2_280e_iffalse,
layer_MUX_uxn_device_h_l88_c2_280e_return_output);

-- is_drawing_port_MUX_uxn_device_h_l88_c2_280e
is_drawing_port_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond,
is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue,
is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse,
is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output);

-- x_MUX_uxn_device_h_l88_c2_280e
x_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l88_c2_280e_cond,
x_MUX_uxn_device_h_l88_c2_280e_iftrue,
x_MUX_uxn_device_h_l88_c2_280e_iffalse,
x_MUX_uxn_device_h_l88_c2_280e_return_output);

-- auto_advance_MUX_uxn_device_h_l88_c2_280e
auto_advance_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l88_c2_280e_cond,
auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue,
auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse,
auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output);

-- color_MUX_uxn_device_h_l88_c2_280e
color_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l88_c2_280e_cond,
color_MUX_uxn_device_h_l88_c2_280e_iftrue,
color_MUX_uxn_device_h_l88_c2_280e_iffalse,
color_MUX_uxn_device_h_l88_c2_280e_return_output);

-- ram_addr_MUX_uxn_device_h_l88_c2_280e
ram_addr_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l88_c2_280e_cond,
ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue,
ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse,
ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output);

-- tmp8_MUX_uxn_device_h_l88_c2_280e
tmp8_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l88_c2_280e_cond,
tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue,
tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse,
tmp8_MUX_uxn_device_h_l88_c2_280e_return_output);

-- result_MUX_uxn_device_h_l88_c2_280e
result_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l88_c2_280e_cond,
result_MUX_uxn_device_h_l88_c2_280e_iftrue,
result_MUX_uxn_device_h_l88_c2_280e_iffalse,
result_MUX_uxn_device_h_l88_c2_280e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l88_c2_280e
ctrl_mode_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond,
ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue,
ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse,
ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output);

-- is_pixel_port_MUX_uxn_device_h_l88_c2_280e
is_pixel_port_MUX_uxn_device_h_l88_c2_280e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond,
is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue,
is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse,
is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c19_c0f2
BIN_OP_EQ_uxn_device_h_l89_c19_c0f2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left,
BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right,
BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output);

-- MUX_uxn_device_h_l89_c19_78f4
MUX_uxn_device_h_l89_c19_78f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l89_c19_78f4_cond,
MUX_uxn_device_h_l89_c19_78f4_iftrue,
MUX_uxn_device_h_l89_c19_78f4_iffalse,
MUX_uxn_device_h_l89_c19_78f4_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c20_a2b3
BIN_OP_EQ_uxn_device_h_l90_c20_a2b3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left,
BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right,
BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output);

-- MUX_uxn_device_h_l90_c20_c77f
MUX_uxn_device_h_l90_c20_c77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l90_c20_c77f_cond,
MUX_uxn_device_h_l90_c20_c77f_iftrue,
MUX_uxn_device_h_l90_c20_c77f_iffalse,
MUX_uxn_device_h_l90_c20_c77f_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c21_9c37
BIN_OP_OR_uxn_device_h_l91_c21_9c37 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c21_9c37_left,
BIN_OP_OR_uxn_device_h_l91_c21_9c37_right,
BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l94_c3_b041
result_is_deo_done_MUX_uxn_device_h_l94_c3_b041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond,
result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue,
result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse,
result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l94_c3_b041
result_device_ram_address_MUX_uxn_device_h_l94_c3_b041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond,
result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue,
result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse,
result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output);

-- MUX_uxn_device_h_l95_c32_6ab6
MUX_uxn_device_h_l95_c32_6ab6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c32_6ab6_cond,
MUX_uxn_device_h_l95_c32_6ab6_iftrue,
MUX_uxn_device_h_l95_c32_6ab6_iffalse,
MUX_uxn_device_h_l95_c32_6ab6_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_4eac
BIN_OP_EQ_uxn_device_h_l101_c11_4eac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left,
BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right,
BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- ctrl_MUX_uxn_device_h_l101_c7_6912
ctrl_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l101_c7_6912_cond,
ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue,
ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse,
ctrl_MUX_uxn_device_h_l101_c7_6912_return_output);

-- flip_x_MUX_uxn_device_h_l101_c7_6912
flip_x_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l101_c7_6912_cond,
flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue,
flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse,
flip_x_MUX_uxn_device_h_l101_c7_6912_return_output);

-- y_MUX_uxn_device_h_l101_c7_6912
y_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_6912_cond,
y_MUX_uxn_device_h_l101_c7_6912_iftrue,
y_MUX_uxn_device_h_l101_c7_6912_iffalse,
y_MUX_uxn_device_h_l101_c7_6912_return_output);

-- flip_y_MUX_uxn_device_h_l101_c7_6912
flip_y_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l101_c7_6912_cond,
flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue,
flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse,
flip_y_MUX_uxn_device_h_l101_c7_6912_return_output);

-- layer_MUX_uxn_device_h_l101_c7_6912
layer_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l101_c7_6912_cond,
layer_MUX_uxn_device_h_l101_c7_6912_iftrue,
layer_MUX_uxn_device_h_l101_c7_6912_iffalse,
layer_MUX_uxn_device_h_l101_c7_6912_return_output);

-- x_MUX_uxn_device_h_l101_c7_6912
x_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_6912_cond,
x_MUX_uxn_device_h_l101_c7_6912_iftrue,
x_MUX_uxn_device_h_l101_c7_6912_iffalse,
x_MUX_uxn_device_h_l101_c7_6912_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_6912
auto_advance_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_6912_cond,
auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output);

-- color_MUX_uxn_device_h_l101_c7_6912
color_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l101_c7_6912_cond,
color_MUX_uxn_device_h_l101_c7_6912_iftrue,
color_MUX_uxn_device_h_l101_c7_6912_iffalse,
color_MUX_uxn_device_h_l101_c7_6912_return_output);

-- ram_addr_MUX_uxn_device_h_l101_c7_6912
ram_addr_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l101_c7_6912_cond,
ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue,
ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse,
ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output);

-- tmp8_MUX_uxn_device_h_l101_c7_6912
tmp8_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l101_c7_6912_cond,
tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue,
tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse,
tmp8_MUX_uxn_device_h_l101_c7_6912_return_output);

-- result_MUX_uxn_device_h_l101_c7_6912
result_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l101_c7_6912_cond,
result_MUX_uxn_device_h_l101_c7_6912_iftrue,
result_MUX_uxn_device_h_l101_c7_6912_iffalse,
result_MUX_uxn_device_h_l101_c7_6912_return_output);

-- ctrl_mode_MUX_uxn_device_h_l101_c7_6912
ctrl_mode_MUX_uxn_device_h_l101_c7_6912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond,
ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue,
ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse,
ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd
result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_a1d2
BIN_OP_EQ_uxn_device_h_l106_c11_a1d2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left,
BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right,
BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- ctrl_MUX_uxn_device_h_l106_c7_2b07
ctrl_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l106_c7_2b07_cond,
ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue,
ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse,
ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- flip_x_MUX_uxn_device_h_l106_c7_2b07
flip_x_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l106_c7_2b07_cond,
flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue,
flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse,
flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- y_MUX_uxn_device_h_l106_c7_2b07
y_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_2b07_cond,
y_MUX_uxn_device_h_l106_c7_2b07_iftrue,
y_MUX_uxn_device_h_l106_c7_2b07_iffalse,
y_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- flip_y_MUX_uxn_device_h_l106_c7_2b07
flip_y_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l106_c7_2b07_cond,
flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue,
flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse,
flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- layer_MUX_uxn_device_h_l106_c7_2b07
layer_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l106_c7_2b07_cond,
layer_MUX_uxn_device_h_l106_c7_2b07_iftrue,
layer_MUX_uxn_device_h_l106_c7_2b07_iffalse,
layer_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- x_MUX_uxn_device_h_l106_c7_2b07
x_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_2b07_cond,
x_MUX_uxn_device_h_l106_c7_2b07_iftrue,
x_MUX_uxn_device_h_l106_c7_2b07_iffalse,
x_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_2b07
auto_advance_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond,
auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- color_MUX_uxn_device_h_l106_c7_2b07
color_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l106_c7_2b07_cond,
color_MUX_uxn_device_h_l106_c7_2b07_iftrue,
color_MUX_uxn_device_h_l106_c7_2b07_iffalse,
color_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- ram_addr_MUX_uxn_device_h_l106_c7_2b07
ram_addr_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond,
ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue,
ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse,
ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- tmp8_MUX_uxn_device_h_l106_c7_2b07
tmp8_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l106_c7_2b07_cond,
tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue,
tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse,
tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- result_MUX_uxn_device_h_l106_c7_2b07
result_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l106_c7_2b07_cond,
result_MUX_uxn_device_h_l106_c7_2b07_iftrue,
result_MUX_uxn_device_h_l106_c7_2b07_iffalse,
result_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- ctrl_mode_MUX_uxn_device_h_l106_c7_2b07
ctrl_mode_MUX_uxn_device_h_l106_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond,
ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue,
ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse,
ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output);

-- ctrl_MUX_uxn_device_h_l107_c3_aae2
ctrl_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l107_c3_aae2_cond,
ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue,
ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse,
ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- flip_x_MUX_uxn_device_h_l107_c3_aae2
flip_x_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l107_c3_aae2_cond,
flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue,
flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse,
flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- flip_y_MUX_uxn_device_h_l107_c3_aae2
flip_y_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l107_c3_aae2_cond,
flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue,
flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse,
flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- layer_MUX_uxn_device_h_l107_c3_aae2
layer_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l107_c3_aae2_cond,
layer_MUX_uxn_device_h_l107_c3_aae2_iftrue,
layer_MUX_uxn_device_h_l107_c3_aae2_iffalse,
layer_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- color_MUX_uxn_device_h_l107_c3_aae2
color_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l107_c3_aae2_cond,
color_MUX_uxn_device_h_l107_c3_aae2_iftrue,
color_MUX_uxn_device_h_l107_c3_aae2_iffalse,
color_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2
result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l107_c3_aae2
ctrl_mode_MUX_uxn_device_h_l107_c3_aae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond,
ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue,
ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse,
ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output);

-- CONST_SR_7_uxn_device_h_l110_c26_86c8
CONST_SR_7_uxn_device_h_l110_c26_86c8 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l110_c26_86c8_x,
CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output);

-- CONST_SR_6_uxn_device_h_l111_c22_51c1
CONST_SR_6_uxn_device_h_l111_c22_51c1 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l111_c22_51c1_x,
CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output);

-- CONST_SR_5_uxn_device_h_l112_c23_7aa4
CONST_SR_5_uxn_device_h_l112_c23_7aa4 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l112_c23_7aa4_x,
CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output);

-- CONST_SR_4_uxn_device_h_l113_c23_cf55
CONST_SR_4_uxn_device_h_l113_c23_cf55 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l113_c23_cf55_x,
CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c11_ced0
BIN_OP_EQ_uxn_device_h_l117_c11_ced0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left,
BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right,
BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- y_MUX_uxn_device_h_l117_c7_db9a
y_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l117_c7_db9a_cond,
y_MUX_uxn_device_h_l117_c7_db9a_iftrue,
y_MUX_uxn_device_h_l117_c7_db9a_iffalse,
y_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- x_MUX_uxn_device_h_l117_c7_db9a
x_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c7_db9a_cond,
x_MUX_uxn_device_h_l117_c7_db9a_iftrue,
x_MUX_uxn_device_h_l117_c7_db9a_iffalse,
x_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- auto_advance_MUX_uxn_device_h_l117_c7_db9a
auto_advance_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond,
auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue,
auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse,
auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- ram_addr_MUX_uxn_device_h_l117_c7_db9a
ram_addr_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond,
ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue,
ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse,
ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- tmp8_MUX_uxn_device_h_l117_c7_db9a
tmp8_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l117_c7_db9a_cond,
tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue,
tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse,
tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- result_MUX_uxn_device_h_l117_c7_db9a
result_MUX_uxn_device_h_l117_c7_db9a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l117_c7_db9a_cond,
result_MUX_uxn_device_h_l117_c7_db9a_iftrue,
result_MUX_uxn_device_h_l117_c7_db9a_iffalse,
result_MUX_uxn_device_h_l117_c7_db9a_return_output);

-- x_MUX_uxn_device_h_l118_c3_c752
x_MUX_uxn_device_h_l118_c3_c752 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l118_c3_c752_cond,
x_MUX_uxn_device_h_l118_c3_c752_iftrue,
x_MUX_uxn_device_h_l118_c3_c752_iffalse,
x_MUX_uxn_device_h_l118_c3_c752_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l118_c3_c752
result_device_ram_address_MUX_uxn_device_h_l118_c3_c752 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond,
result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue,
result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse,
result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_f835
BIN_OP_EQ_uxn_device_h_l124_c11_f835 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_f835_left,
BIN_OP_EQ_uxn_device_h_l124_c11_f835_right,
BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- y_MUX_uxn_device_h_l124_c7_cfd2
y_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_cfd2_cond,
y_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
y_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
y_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- x_MUX_uxn_device_h_l124_c7_cfd2
x_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l124_c7_cfd2_cond,
x_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
x_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
x_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_cfd2
auto_advance_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond,
auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- ram_addr_MUX_uxn_device_h_l124_c7_cfd2
ram_addr_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond,
ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- tmp8_MUX_uxn_device_h_l124_c7_cfd2
tmp8_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond,
tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- result_MUX_uxn_device_h_l124_c7_cfd2
result_MUX_uxn_device_h_l124_c7_cfd2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l124_c7_cfd2_cond,
result_MUX_uxn_device_h_l124_c7_cfd2_iftrue,
result_MUX_uxn_device_h_l124_c7_cfd2_iffalse,
result_MUX_uxn_device_h_l124_c7_cfd2_return_output);

-- x_MUX_uxn_device_h_l125_c3_e355
x_MUX_uxn_device_h_l125_c3_e355 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c3_e355_cond,
x_MUX_uxn_device_h_l125_c3_e355_iftrue,
x_MUX_uxn_device_h_l125_c3_e355_iffalse,
x_MUX_uxn_device_h_l125_c3_e355_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_e355
result_device_ram_address_MUX_uxn_device_h_l125_c3_e355 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output);

-- BIN_OP_OR_uxn_device_h_l126_c4_d2c8
BIN_OP_OR_uxn_device_h_l126_c4_d2c8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left,
BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right,
BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_a899
BIN_OP_EQ_uxn_device_h_l130_c11_a899 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_a899_left,
BIN_OP_EQ_uxn_device_h_l130_c11_a899_right,
BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- y_MUX_uxn_device_h_l130_c7_92a9
y_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_92a9_cond,
y_MUX_uxn_device_h_l130_c7_92a9_iftrue,
y_MUX_uxn_device_h_l130_c7_92a9_iffalse,
y_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- x_MUX_uxn_device_h_l130_c7_92a9
x_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l130_c7_92a9_cond,
x_MUX_uxn_device_h_l130_c7_92a9_iftrue,
x_MUX_uxn_device_h_l130_c7_92a9_iffalse,
x_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_92a9
auto_advance_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond,
auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- ram_addr_MUX_uxn_device_h_l130_c7_92a9
ram_addr_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond,
ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue,
ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse,
ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- tmp8_MUX_uxn_device_h_l130_c7_92a9
tmp8_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l130_c7_92a9_cond,
tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue,
tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse,
tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- result_MUX_uxn_device_h_l130_c7_92a9
result_MUX_uxn_device_h_l130_c7_92a9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l130_c7_92a9_cond,
result_MUX_uxn_device_h_l130_c7_92a9_iftrue,
result_MUX_uxn_device_h_l130_c7_92a9_iffalse,
result_MUX_uxn_device_h_l130_c7_92a9_return_output);

-- y_MUX_uxn_device_h_l131_c3_71ca
y_MUX_uxn_device_h_l131_c3_71ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l131_c3_71ca_cond,
y_MUX_uxn_device_h_l131_c3_71ca_iftrue,
y_MUX_uxn_device_h_l131_c3_71ca_iffalse,
y_MUX_uxn_device_h_l131_c3_71ca_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca
result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_c693
BIN_OP_EQ_uxn_device_h_l137_c11_c693 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_c693_left,
BIN_OP_EQ_uxn_device_h_l137_c11_c693_right,
BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output);

-- y_MUX_uxn_device_h_l137_c7_50c4
y_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_50c4_cond,
y_MUX_uxn_device_h_l137_c7_50c4_iftrue,
y_MUX_uxn_device_h_l137_c7_50c4_iffalse,
y_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- x_MUX_uxn_device_h_l137_c7_50c4
x_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l137_c7_50c4_cond,
x_MUX_uxn_device_h_l137_c7_50c4_iftrue,
x_MUX_uxn_device_h_l137_c7_50c4_iffalse,
x_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_50c4
auto_advance_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond,
auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- ram_addr_MUX_uxn_device_h_l137_c7_50c4
ram_addr_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond,
ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue,
ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse,
ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- tmp8_MUX_uxn_device_h_l137_c7_50c4
tmp8_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l137_c7_50c4_cond,
tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue,
tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse,
tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- result_MUX_uxn_device_h_l137_c7_50c4
result_MUX_uxn_device_h_l137_c7_50c4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l137_c7_50c4_cond,
result_MUX_uxn_device_h_l137_c7_50c4_iftrue,
result_MUX_uxn_device_h_l137_c7_50c4_iffalse,
result_MUX_uxn_device_h_l137_c7_50c4_return_output);

-- y_MUX_uxn_device_h_l138_c3_abd8
y_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_abd8_cond,
y_MUX_uxn_device_h_l138_c3_abd8_iftrue,
y_MUX_uxn_device_h_l138_c3_abd8_iffalse,
y_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- tmp8_MUX_uxn_device_h_l138_c3_abd8
tmp8_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l138_c3_abd8_cond,
tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue,
tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse,
tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- result_u16_addr_MUX_uxn_device_h_l138_c3_abd8
result_u16_addr_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond,
result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue,
result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse,
result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8
result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond,
result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8
result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8
result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- result_u8_value_MUX_uxn_device_h_l138_c3_abd8
result_u8_value_MUX_uxn_device_h_l138_c3_abd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond,
result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue,
result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse,
result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output);

-- BIN_OP_AND_uxn_device_h_l141_c11_07e7
BIN_OP_AND_uxn_device_h_l141_c11_07e7 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l141_c11_07e7_left,
BIN_OP_AND_uxn_device_h_l141_c11_07e7_right,
BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output);

-- BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca
BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca : entity work.BIN_OP_PLUS_uint32_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left,
BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right,
BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output);

-- tmp8_MUX_uxn_device_h_l145_c4_48f4
tmp8_MUX_uxn_device_h_l145_c4_48f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l145_c4_48f4_cond,
tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue,
tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse,
tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output);

-- MUX_uxn_device_h_l146_c13_2eb4
MUX_uxn_device_h_l146_c13_2eb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l146_c13_2eb4_cond,
MUX_uxn_device_h_l146_c13_2eb4_iftrue,
MUX_uxn_device_h_l146_c13_2eb4_iffalse,
MUX_uxn_device_h_l146_c13_2eb4_return_output);

-- BIN_OP_OR_uxn_device_h_l146_c5_aa77
BIN_OP_OR_uxn_device_h_l146_c5_aa77 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l146_c5_aa77_left,
BIN_OP_OR_uxn_device_h_l146_c5_aa77_right,
BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output);

-- MUX_uxn_device_h_l147_c13_164e
MUX_uxn_device_h_l147_c13_164e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c13_164e_cond,
MUX_uxn_device_h_l147_c13_164e_iftrue,
MUX_uxn_device_h_l147_c13_164e_iffalse,
MUX_uxn_device_h_l147_c13_164e_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c5_0cc4
BIN_OP_OR_uxn_device_h_l147_c5_0cc4 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left,
BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right,
BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output);

-- y_MUX_uxn_device_h_l152_c8_7f1e
y_MUX_uxn_device_h_l152_c8_7f1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l152_c8_7f1e_cond,
y_MUX_uxn_device_h_l152_c8_7f1e_iftrue,
y_MUX_uxn_device_h_l152_c8_7f1e_iffalse,
y_MUX_uxn_device_h_l152_c8_7f1e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e
result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output);

-- BIN_OP_EQ_uxn_device_h_l157_c11_834a
BIN_OP_EQ_uxn_device_h_l157_c11_834a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l157_c11_834a_left,
BIN_OP_EQ_uxn_device_h_l157_c11_834a_right,
BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output);

-- x_MUX_uxn_device_h_l157_c7_0486
x_MUX_uxn_device_h_l157_c7_0486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l157_c7_0486_cond,
x_MUX_uxn_device_h_l157_c7_0486_iftrue,
x_MUX_uxn_device_h_l157_c7_0486_iffalse,
x_MUX_uxn_device_h_l157_c7_0486_return_output);

-- auto_advance_MUX_uxn_device_h_l157_c7_0486
auto_advance_MUX_uxn_device_h_l157_c7_0486 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l157_c7_0486_cond,
auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue,
auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse,
auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output);

-- ram_addr_MUX_uxn_device_h_l157_c7_0486
ram_addr_MUX_uxn_device_h_l157_c7_0486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l157_c7_0486_cond,
ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue,
ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse,
ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output);

-- result_MUX_uxn_device_h_l157_c7_0486
result_MUX_uxn_device_h_l157_c7_0486 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l157_c7_0486_cond,
result_MUX_uxn_device_h_l157_c7_0486_iftrue,
result_MUX_uxn_device_h_l157_c7_0486_iffalse,
result_MUX_uxn_device_h_l157_c7_0486_return_output);

-- x_MUX_uxn_device_h_l158_c3_dde8
x_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l158_c3_dde8_cond,
x_MUX_uxn_device_h_l158_c3_dde8_iftrue,
x_MUX_uxn_device_h_l158_c3_dde8_iffalse,
x_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- auto_advance_MUX_uxn_device_h_l158_c3_dde8
auto_advance_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond,
auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue,
auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse,
auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_u16_addr_MUX_uxn_device_h_l158_c3_dde8
result_u16_addr_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond,
result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8
result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond,
result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8
result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond,
result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8
result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond,
result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- result_u8_value_MUX_uxn_device_h_l158_c3_dde8
result_u8_value_MUX_uxn_device_h_l158_c3_dde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond,
result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue,
result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse,
result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output);

-- UNARY_OP_NOT_uxn_device_h_l163_c9_0691
UNARY_OP_NOT_uxn_device_h_l163_c9_0691 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr,
UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output);

-- x_MUX_uxn_device_h_l163_c4_4950
x_MUX_uxn_device_h_l163_c4_4950 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l163_c4_4950_cond,
x_MUX_uxn_device_h_l163_c4_4950_iftrue,
x_MUX_uxn_device_h_l163_c4_4950_iffalse,
x_MUX_uxn_device_h_l163_c4_4950_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l163_c4_4950
result_is_deo_done_MUX_uxn_device_h_l163_c4_4950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond,
result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue,
result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse,
result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l163_c4_4950
result_device_ram_address_MUX_uxn_device_h_l163_c4_4950 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond,
result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue,
result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse,
result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output);

-- result_u8_value_MUX_uxn_device_h_l163_c4_4950
result_u8_value_MUX_uxn_device_h_l163_c4_4950 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond,
result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue,
result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse,
result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c9_6e31
BIN_OP_AND_uxn_device_h_l164_c9_6e31 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c9_6e31_left,
BIN_OP_AND_uxn_device_h_l164_c9_6e31_right,
BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output);

-- BIN_OP_NEQ_uxn_device_h_l164_c9_8b71
BIN_OP_NEQ_uxn_device_h_l164_c9_8b71 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left,
BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right,
BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output);

-- x_MUX_uxn_device_h_l164_c5_ad6d
x_MUX_uxn_device_h_l164_c5_ad6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l164_c5_ad6d_cond,
x_MUX_uxn_device_h_l164_c5_ad6d_iftrue,
x_MUX_uxn_device_h_l164_c5_ad6d_iffalse,
x_MUX_uxn_device_h_l164_c5_ad6d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d
result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output);

-- result_u8_value_MUX_uxn_device_h_l164_c5_ad6d
result_u8_value_MUX_uxn_device_h_l164_c5_ad6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond,
result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue,
result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse,
result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c6_5396
BIN_OP_PLUS_uxn_device_h_l165_c6_5396 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left,
BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right,
BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output);

-- CONST_SR_8_uxn_device_h_l168_c34_7905
CONST_SR_8_uxn_device_h_l168_c34_7905 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l168_c34_7905_x,
CONST_SR_8_uxn_device_h_l168_c34_7905_return_output);

-- auto_advance_MUX_uxn_device_h_l174_c8_b432
auto_advance_MUX_uxn_device_h_l174_c8_b432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l174_c8_b432_cond,
auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue,
auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse,
auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l174_c8_b432
result_device_ram_address_MUX_uxn_device_h_l174_c8_b432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond,
result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue,
result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse,
result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c11_1e62
BIN_OP_EQ_uxn_device_h_l179_c11_1e62 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left,
BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right,
BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output);

-- ram_addr_MUX_uxn_device_h_l179_c7_b689
ram_addr_MUX_uxn_device_h_l179_c7_b689 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l179_c7_b689_cond,
ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue,
ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse,
ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output);

-- result_MUX_uxn_device_h_l179_c7_b689
result_MUX_uxn_device_h_l179_c7_b689 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l179_c7_b689_cond,
result_MUX_uxn_device_h_l179_c7_b689_iftrue,
result_MUX_uxn_device_h_l179_c7_b689_iffalse,
result_MUX_uxn_device_h_l179_c7_b689_return_output);

-- ram_addr_MUX_uxn_device_h_l180_c3_27ef
ram_addr_MUX_uxn_device_h_l180_c3_27ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond,
ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue,
ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse,
ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef
result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c3_27ef
result_u8_value_MUX_uxn_device_h_l180_c3_27ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond,
result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c8_eb03
BIN_OP_AND_uxn_device_h_l181_c8_eb03 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c8_eb03_left,
BIN_OP_AND_uxn_device_h_l181_c8_eb03_right,
BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output);

-- BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4
BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left,
BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right,
BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a
result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c4_a06a
result_u8_value_MUX_uxn_device_h_l181_c4_a06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond,
result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output);

-- ram_addr_MUX_uxn_device_h_l187_c8_f3ed
ram_addr_MUX_uxn_device_h_l187_c8_f3ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond,
ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue,
ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse,
ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output);

-- BIN_OP_EQ_uxn_device_h_l192_c11_8ee8
BIN_OP_EQ_uxn_device_h_l192_c11_8ee8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left,
BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right,
BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output);

-- ram_addr_MUX_uxn_device_h_l192_c7_1b7a
ram_addr_MUX_uxn_device_h_l192_c7_1b7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond,
ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue,
ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse,
ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output);

-- result_MUX_uxn_device_h_l192_c7_1b7a
result_MUX_uxn_device_h_l192_c7_1b7a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l192_c7_1b7a_cond,
result_MUX_uxn_device_h_l192_c7_1b7a_iftrue,
result_MUX_uxn_device_h_l192_c7_1b7a_iffalse,
result_MUX_uxn_device_h_l192_c7_1b7a_return_output);

-- ram_addr_MUX_uxn_device_h_l193_c3_bcf4
ram_addr_MUX_uxn_device_h_l193_c3_bcf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond,
ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue,
ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse,
ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4
result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond,
result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output);

-- result_u8_value_MUX_uxn_device_h_l193_c3_bcf4
result_u8_value_MUX_uxn_device_h_l193_c3_bcf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond,
result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue,
result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse,
result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output);

-- BIN_OP_AND_uxn_device_h_l194_c9_6a74
BIN_OP_AND_uxn_device_h_l194_c9_6a74 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l194_c9_6a74_left,
BIN_OP_AND_uxn_device_h_l194_c9_6a74_right,
BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output);

-- BIN_OP_NEQ_uxn_device_h_l194_c9_4f65
BIN_OP_NEQ_uxn_device_h_l194_c9_4f65 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left,
BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right,
BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02
result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond,
result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue,
result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse,
result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output);

-- result_u8_value_MUX_uxn_device_h_l194_c4_7d02
result_u8_value_MUX_uxn_device_h_l194_c4_7d02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond,
result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue,
result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse,
result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output);

-- CONST_SR_8_uxn_device_h_l197_c33_c05f
CONST_SR_8_uxn_device_h_l197_c33_c05f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l197_c33_c05f_x,
CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output);

-- ram_addr_MUX_uxn_device_h_l200_c8_d330
ram_addr_MUX_uxn_device_h_l200_c8_d330 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l200_c8_d330_cond,
ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue,
ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse,
ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output);

-- BIN_OP_OR_uxn_device_h_l201_c4_abbd
BIN_OP_OR_uxn_device_h_l201_c4_abbd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l201_c4_abbd_left,
BIN_OP_OR_uxn_device_h_l201_c4_abbd_right,
BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output);

-- BIN_OP_EQ_uxn_device_h_l204_c11_82d2
BIN_OP_EQ_uxn_device_h_l204_c11_82d2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left,
BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right,
BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output);

-- result_MUX_uxn_device_h_l204_c7_3177
result_MUX_uxn_device_h_l204_c7_3177 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l204_c7_3177_cond,
result_MUX_uxn_device_h_l204_c7_3177_iftrue,
result_MUX_uxn_device_h_l204_c7_3177_iffalse,
result_MUX_uxn_device_h_l204_c7_3177_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe
result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond,
result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue,
result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse,
result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output);

-- result_u8_value_MUX_uxn_device_h_l205_c3_bfbe
result_u8_value_MUX_uxn_device_h_l205_c3_bfbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond,
result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue,
result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse,
result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output);

-- BIN_OP_AND_uxn_device_h_l206_c9_6059
BIN_OP_AND_uxn_device_h_l206_c9_6059 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l206_c9_6059_left,
BIN_OP_AND_uxn_device_h_l206_c9_6059_right,
BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output);

-- BIN_OP_NEQ_uxn_device_h_l206_c9_9927
BIN_OP_NEQ_uxn_device_h_l206_c9_9927 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left,
BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right,
BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l206_c4_e376
result_device_ram_address_MUX_uxn_device_h_l206_c4_e376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond,
result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue,
result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse,
result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output);

-- result_u8_value_MUX_uxn_device_h_l206_c4_e376
result_u8_value_MUX_uxn_device_h_l206_c4_e376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond,
result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue,
result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse,
result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output);

-- result_MUX_uxn_device_h_l214_c3_d953
result_MUX_uxn_device_h_l214_c3_d953 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l214_c3_d953_cond,
result_MUX_uxn_device_h_l214_c3_d953_iftrue,
result_MUX_uxn_device_h_l214_c3_d953_iffalse,
result_MUX_uxn_device_h_l214_c3_d953_return_output);

-- BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d
BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left,
BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right,
BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output);

-- screen_blit_uxn_device_h_l215_c46_fae6
screen_blit_uxn_device_h_l215_c46_fae6 : entity work.screen_blit_0CLK_89be7393 port map (
clk,
screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE,
screen_blit_uxn_device_h_l215_c46_fae6_phase,
screen_blit_uxn_device_h_l215_c46_fae6_ctrl,
screen_blit_uxn_device_h_l215_c46_fae6_auto_advance,
screen_blit_uxn_device_h_l215_c46_fae6_x,
screen_blit_uxn_device_h_l215_c46_fae6_y,
screen_blit_uxn_device_h_l215_c46_fae6_ram_addr,
screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read,
screen_blit_uxn_device_h_l215_c46_fae6_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957
CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x,
CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x,
CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output,
 ctrl_MUX_uxn_device_h_l88_c2_280e_return_output,
 flip_x_MUX_uxn_device_h_l88_c2_280e_return_output,
 is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output,
 y_MUX_uxn_device_h_l88_c2_280e_return_output,
 flip_y_MUX_uxn_device_h_l88_c2_280e_return_output,
 layer_MUX_uxn_device_h_l88_c2_280e_return_output,
 is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output,
 x_MUX_uxn_device_h_l88_c2_280e_return_output,
 auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output,
 color_MUX_uxn_device_h_l88_c2_280e_return_output,
 ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output,
 tmp8_MUX_uxn_device_h_l88_c2_280e_return_output,
 result_MUX_uxn_device_h_l88_c2_280e_return_output,
 ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output,
 is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output,
 MUX_uxn_device_h_l89_c19_78f4_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output,
 MUX_uxn_device_h_l90_c20_c77f_return_output,
 BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output,
 result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output,
 result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output,
 MUX_uxn_device_h_l95_c32_6ab6_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output,
 ctrl_MUX_uxn_device_h_l101_c7_6912_return_output,
 flip_x_MUX_uxn_device_h_l101_c7_6912_return_output,
 y_MUX_uxn_device_h_l101_c7_6912_return_output,
 flip_y_MUX_uxn_device_h_l101_c7_6912_return_output,
 layer_MUX_uxn_device_h_l101_c7_6912_return_output,
 x_MUX_uxn_device_h_l101_c7_6912_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output,
 color_MUX_uxn_device_h_l101_c7_6912_return_output,
 ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output,
 tmp8_MUX_uxn_device_h_l101_c7_6912_return_output,
 result_MUX_uxn_device_h_l101_c7_6912_return_output,
 ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output,
 ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output,
 flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output,
 y_MUX_uxn_device_h_l106_c7_2b07_return_output,
 flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output,
 layer_MUX_uxn_device_h_l106_c7_2b07_return_output,
 x_MUX_uxn_device_h_l106_c7_2b07_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output,
 color_MUX_uxn_device_h_l106_c7_2b07_return_output,
 ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output,
 tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output,
 result_MUX_uxn_device_h_l106_c7_2b07_return_output,
 ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output,
 ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output,
 flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output,
 flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output,
 layer_MUX_uxn_device_h_l107_c3_aae2_return_output,
 color_MUX_uxn_device_h_l107_c3_aae2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output,
 ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output,
 CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output,
 CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output,
 CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output,
 CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 y_MUX_uxn_device_h_l117_c7_db9a_return_output,
 x_MUX_uxn_device_h_l117_c7_db9a_return_output,
 auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output,
 ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output,
 tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output,
 result_MUX_uxn_device_h_l117_c7_db9a_return_output,
 x_MUX_uxn_device_h_l118_c3_c752_return_output,
 result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output,
 y_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 x_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 result_MUX_uxn_device_h_l124_c7_cfd2_return_output,
 x_MUX_uxn_device_h_l125_c3_e355_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output,
 BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output,
 y_MUX_uxn_device_h_l130_c7_92a9_return_output,
 x_MUX_uxn_device_h_l130_c7_92a9_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output,
 ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output,
 tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output,
 result_MUX_uxn_device_h_l130_c7_92a9_return_output,
 y_MUX_uxn_device_h_l131_c3_71ca_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output,
 y_MUX_uxn_device_h_l137_c7_50c4_return_output,
 x_MUX_uxn_device_h_l137_c7_50c4_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output,
 ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output,
 tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output,
 result_MUX_uxn_device_h_l137_c7_50c4_return_output,
 y_MUX_uxn_device_h_l138_c3_abd8_return_output,
 tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output,
 result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output,
 result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output,
 BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output,
 BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output,
 tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output,
 MUX_uxn_device_h_l146_c13_2eb4_return_output,
 BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output,
 MUX_uxn_device_h_l147_c13_164e_return_output,
 BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output,
 y_MUX_uxn_device_h_l152_c8_7f1e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output,
 BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output,
 x_MUX_uxn_device_h_l157_c7_0486_return_output,
 auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output,
 ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output,
 result_MUX_uxn_device_h_l157_c7_0486_return_output,
 x_MUX_uxn_device_h_l158_c3_dde8_return_output,
 auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output,
 result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output,
 UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output,
 x_MUX_uxn_device_h_l163_c4_4950_return_output,
 result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output,
 result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output,
 result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output,
 BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output,
 BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output,
 x_MUX_uxn_device_h_l164_c5_ad6d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output,
 result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output,
 CONST_SR_8_uxn_device_h_l168_c34_7905_return_output,
 auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output,
 result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output,
 ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output,
 result_MUX_uxn_device_h_l179_c7_b689_return_output,
 ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output,
 BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output,
 BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output,
 ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output,
 BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output,
 ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output,
 result_MUX_uxn_device_h_l192_c7_1b7a_return_output,
 ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output,
 result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output,
 BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output,
 BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output,
 result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output,
 result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output,
 CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output,
 ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output,
 BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output,
 BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output,
 result_MUX_uxn_device_h_l204_c7_3177_return_output,
 result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output,
 result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output,
 BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output,
 BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output,
 result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output,
 result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output,
 result_MUX_uxn_device_h_l214_c3_d953_return_output,
 BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output,
 screen_blit_uxn_device_h_l215_c46_fae6_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l88_c2_280e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_280e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_280e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6912_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_280e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_78f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_78f4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_78f4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l89_c19_78f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_c77f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_c77f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_c77f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l90_c20_c77f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6ab6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6ab6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6ab6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c32_6ab6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l101_c7_6912_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6912_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6912_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_2b07_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l106_c7_2b07_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_2b07_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_2b07_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_db9a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_aa65_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_004e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2cd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_c78b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_0f36_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_c752_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l117_c7_db9a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_db9a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_db9a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_cfd2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l117_c7_db9a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_c752_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_c752_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c3_c752_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_e355_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_cfd2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_92a9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l124_c7_cfd2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_e355_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_e355_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c3_e355_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_71ca_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l130_c7_92a9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_92a9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_92a9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_50c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l130_c7_92a9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_71ca_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_71ca_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c3_71ca_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l137_c7_50c4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b26_uxn_device_h_l137_c7_50c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_50c4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_0486_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l137_c7_50c4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7f1e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l142_c4_2bdf : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_abd8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l139_c4_d620 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l141_c4_de75 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output : unsigned(32 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_2eb4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_2eb4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_2eb4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l146_c13_2eb4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_164e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_164e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_164e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c13_164e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c8_7f1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l157_c7_0486_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_53a4_uxn_device_h_l157_c7_0486_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_0486_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_b689_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l157_c7_0486_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l161_c4_71ec : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l162_c4_a881 : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l165_c6_f94b : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_374d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l179_c7_b689_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l179_c7_b689_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_b689_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_1b7a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l179_c7_b689_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_34de_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l192_c7_1b7a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_3177_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l192_c7_1b7a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_83cf_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l204_c7_3177_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l204_c7_3177_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_3177_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_d953_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_3177_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_fc76_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l214_c3_d953_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_d953_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_d953_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_d953_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l214_c3_d953_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l217_c4_9622 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1eb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_ae6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_d285_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_830f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_bbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l225_c4_c110 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f94_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_c8c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l158_l163_DUPLICATE_0c61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output : unsigned(7 downto 0);
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
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l139_c4_d620 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue := VAR_result_device_ram_address_uxn_device_h_l139_c4_d620;
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue := to_unsigned(45, 8);
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right := to_unsigned(10, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right := to_unsigned(11, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue := to_unsigned(40, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue := to_unsigned(40, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_right := to_unsigned(5, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l90_c20_c77f_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue := to_unsigned(41, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_right := to_unsigned(6, 8);
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_right := to_unsigned(1, 8);
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right := to_unsigned(3, 8);
     VAR_result_device_ram_address_uxn_device_h_l217_c4_9622 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right := to_unsigned(9, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l90_c20_c77f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_6ab6_iffalse := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_right := to_unsigned(4, 8);
     VAR_result_device_ram_address_uxn_device_h_l225_c4_c110 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l147_c13_164e_iftrue := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right := to_unsigned(0, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l146_c13_2eb4_iftrue := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l147_c13_164e_iffalse := to_unsigned(0, 8);
     VAR_result_u16_addr_uxn_device_h_l161_c4_71ec := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_result_u16_addr_uxn_device_h_l161_c4_71ec;
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right := to_unsigned(260, 16);
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l95_c32_6ab6_iftrue := to_unsigned(46, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l89_c19_78f4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue := to_unsigned(38, 8);
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l146_c13_2eb4_iffalse := to_unsigned(16, 8);
     VAR_MUX_uxn_device_h_l89_c19_78f4_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue := to_unsigned(42, 8);
     VAR_result_u8_value_uxn_device_h_l162_c4_a881 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse := VAR_result_u8_value_uxn_device_h_l162_c4_a881;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse := VAR_result_u8_value_uxn_device_h_l162_c4_a881;
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue := to_unsigned(44, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_left := color;
     VAR_color_MUX_uxn_device_h_l101_c7_6912_iftrue := color;
     VAR_color_MUX_uxn_device_h_l106_c7_2b07_iffalse := color;
     VAR_color_MUX_uxn_device_h_l107_c3_aae2_iffalse := color;
     VAR_color_MUX_uxn_device_h_l88_c2_280e_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l146_c13_2eb4_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l147_c13_164e_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l118_c3_c752_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l125_c3_e355_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l131_c3_71ca_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l158_c3_dde8_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l138_c3_abd8_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l214_c3_d953_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond := is_sprite_port;
     VAR_y_MUX_uxn_device_h_l152_c8_7f1e_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l101_c7_6912_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l88_c2_280e_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_left := VAR_previous_device_ram_read;
     VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_ram_addr := ram_addr;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue := tmp8;
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left := x;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_x := x;
     VAR_x_MUX_uxn_device_h_l101_c7_6912_iftrue := x;
     VAR_x_MUX_uxn_device_h_l106_c7_2b07_iftrue := x;
     VAR_x_MUX_uxn_device_h_l118_c3_c752_iffalse := x;
     VAR_x_MUX_uxn_device_h_l125_c3_e355_iffalse := x;
     VAR_x_MUX_uxn_device_h_l130_c7_92a9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l137_c7_50c4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l157_c7_0486_iffalse := x;
     VAR_x_MUX_uxn_device_h_l158_c3_dde8_iffalse := x;
     VAR_x_MUX_uxn_device_h_l163_c4_4950_iffalse := x;
     VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iffalse := x;
     VAR_x_MUX_uxn_device_h_l88_c2_280e_iftrue := x;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left := y;
     VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_x := y;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_y := y;
     VAR_y_MUX_uxn_device_h_l101_c7_6912_iftrue := y;
     VAR_y_MUX_uxn_device_h_l106_c7_2b07_iftrue := y;
     VAR_y_MUX_uxn_device_h_l117_c7_db9a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l131_c3_71ca_iffalse := y;
     VAR_y_MUX_uxn_device_h_l137_c7_50c4_iffalse := y;
     VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iffalse := y;
     VAR_y_MUX_uxn_device_h_l88_c2_280e_iftrue := y;
     -- CAST_TO_uint8_t[uxn_device_h_l209_c23_fc76] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_fc76_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l101_c11_4eac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;

     -- BIN_OP_EQ[uxn_device_h_l192_c11_8ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_left;
     BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right <= VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output := BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c19_c0f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_left;
     BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output := BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l158_l163_DUPLICATE_0c61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l158_l163_DUPLICATE_0c61_return_output := result.is_deo_done;

     -- MUX[uxn_device_h_l146_c13_2eb4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l146_c13_2eb4_cond <= VAR_MUX_uxn_device_h_l146_c13_2eb4_cond;
     MUX_uxn_device_h_l146_c13_2eb4_iftrue <= VAR_MUX_uxn_device_h_l146_c13_2eb4_iftrue;
     MUX_uxn_device_h_l146_c13_2eb4_iffalse <= VAR_MUX_uxn_device_h_l146_c13_2eb4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l146_c13_2eb4_return_output := MUX_uxn_device_h_l146_c13_2eb4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l204_c11_82d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_left;
     BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output := BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l163_c9_0691] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output := UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_f835] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_f835_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_f835_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;

     -- auto_advance_MUX[uxn_device_h_l174_c8_b432] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l174_c8_b432_cond <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_cond;
     auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iftrue;
     auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output := auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_4[uxn_device_h_l113_c23_cf55] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l113_c23_cf55_x <= VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output := CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output;

     -- ctrl_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_cond;
     ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output := ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_c693] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_c693_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_c693_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;

     -- BIN_OP_EQ[uxn_device_h_l179_c11_1e62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_left;
     BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output := BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output;

     -- CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output := CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output := result.u8_value;

     -- CONST_SR_8[uxn_device_h_l197_c33_c05f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l197_c33_c05f_x <= VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output := CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l184_c23_34de] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_34de_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output := result.is_device_ram_write;

     -- MUX[uxn_device_h_l147_c13_164e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c13_164e_cond <= VAR_MUX_uxn_device_h_l147_c13_164e_cond;
     MUX_uxn_device_h_l147_c13_164e_iftrue <= VAR_MUX_uxn_device_h_l147_c13_164e_iftrue;
     MUX_uxn_device_h_l147_c13_164e_iffalse <= VAR_MUX_uxn_device_h_l147_c13_164e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c13_164e_return_output := MUX_uxn_device_h_l147_c13_164e_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l215_c58_8e8d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_left;
     BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output := BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output;

     -- BIN_OP_AND[uxn_device_h_l164_c9_6e31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c9_6e31_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_left;
     BIN_OP_AND_uxn_device_h_l164_c9_6e31_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output := BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l109_c12_aa65] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_aa65_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_5[uxn_device_h_l112_c23_7aa4] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l112_c23_7aa4_x <= VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output := CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l138_c3_abd8] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_abd8_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l157_c11_834a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l157_c11_834a_left <= VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_left;
     BIN_OP_EQ_uxn_device_h_l157_c11_834a_right <= VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output := BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;

     -- BIN_OP_AND[uxn_device_h_l141_c11_07e7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l141_c11_07e7_left <= VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_left;
     BIN_OP_AND_uxn_device_h_l141_c11_07e7_right <= VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output := BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output;

     -- CONST_SR_7[uxn_device_h_l110_c26_86c8] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l110_c26_86c8_x <= VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output := CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l165_c6_5396] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_left;
     BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output := BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f94 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f94_return_output := result.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_c8c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_c8c7_return_output := result.is_vram_write;

     -- CONST_SR_6[uxn_device_h_l111_c22_51c1] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l111_c22_51c1_x <= VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output := CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_a1d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c11_ced0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_left;
     BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output := BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l214_c3_d953] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_d953_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l225_c4_c110,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_device_h_l181_c8_eb03] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c8_eb03_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_left;
     BIN_OP_AND_uxn_device_h_l181_c8_eb03_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output := BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c20_a2b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_left;
     BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output := BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l88_c6_dd25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_left;
     BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right <= VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output := BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_a899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_a899_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_a899_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l141_c4_de75 := resize(VAR_BIN_OP_AND_uxn_device_h_l141_c11_07e7_return_output, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left := VAR_BIN_OP_AND_uxn_device_h_l164_c9_6e31_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left := VAR_BIN_OP_AND_uxn_device_h_l181_c8_eb03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_4eac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_color_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_layer_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_result_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_a1d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_db9a_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c11_ced0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_result_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_cfd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_f835_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_result_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_x_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_92a9_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a899_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_x_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_50c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_c693_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;
     VAR_result_MUX_uxn_device_h_l157_c7_0486_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;
     VAR_x_MUX_uxn_device_h_l157_c7_0486_cond := VAR_BIN_OP_EQ_uxn_device_h_l157_c11_834a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_b689_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c11_1e62_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_1b7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l192_c11_8ee8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_3177_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_82d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_280e_cond := VAR_BIN_OP_EQ_uxn_device_h_l88_c6_dd25_return_output;
     VAR_MUX_uxn_device_h_l89_c19_78f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c19_c0f2_return_output;
     VAR_MUX_uxn_device_h_l90_c20_c77f_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c20_a2b3_return_output;
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_phase := VAR_BIN_OP_MINUS_uxn_device_h_l215_c58_8e8d_return_output;
     VAR_x_uxn_device_h_l165_c6_f94b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c6_5396_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l126_l153_l201_l132_l119_l188_l140_DUPLICATE_e70d_return_output;
     VAR_color_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l109_c12_aa65_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l184_c23_34de_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l209_c23_fc76_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f94_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l138_l158_DUPLICATE_1f94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l158_l163_DUPLICATE_0c61_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l158_l163_DUPLICATE_0c61_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l164_l194_l206_l205_l163_l158_l181_l180_l193_DUPLICATE_ad36_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_c8c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l138_l158_DUPLICATE_c8c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l164_l194_l152_l206_l102_l125_l107_l205_l174_l94_l163_l181_l180_l131_l118_l193_DUPLICATE_30f0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l194_l206_l138_l205_l158_l181_l180_l193_DUPLICATE_d742_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l194_l206_DUPLICATE_d5e1_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_right := VAR_MUX_uxn_device_h_l146_c13_2eb4_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right := VAR_MUX_uxn_device_h_l147_c13_164e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;
     VAR_x_MUX_uxn_device_h_l163_c4_4950_cond := VAR_UNARY_OP_NOT_uxn_device_h_l163_c9_0691_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l174_c8_b432_return_output;
     VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_ctrl_MUX_uxn_device_h_l107_c3_aae2_return_output;
     VAR_result_MUX_uxn_device_h_l214_c3_d953_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l214_c3_d953_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l138_c3_abd8_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_left := VAR_tmp8_uxn_device_h_l141_c4_de75;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse := VAR_tmp8_uxn_device_h_l141_c4_de75;
     VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_x := VAR_x_uxn_device_h_l165_c6_f94b;
     VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iftrue := VAR_x_uxn_device_h_l165_c6_f94b;
     -- result_device_ram_address_MUX[uxn_device_h_l118_c3_c752] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_cond;
     result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output := result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output;

     -- BIN_OP_OR[uxn_device_h_l146_c5_aa77] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l146_c5_aa77_left <= VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_left;
     BIN_OP_OR_uxn_device_h_l146_c5_aa77_right <= VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output := BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_71ca] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- color_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_color_MUX_uxn_device_h_l107_c3_aae2_cond;
     color_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_color_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     color_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_color_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l107_c3_aae2_return_output := color_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- MUX[uxn_device_h_l90_c20_c77f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l90_c20_c77f_cond <= VAR_MUX_uxn_device_h_l90_c20_c77f_cond;
     MUX_uxn_device_h_l90_c20_c77f_iftrue <= VAR_MUX_uxn_device_h_l90_c20_c77f_iftrue;
     MUX_uxn_device_h_l90_c20_c77f_iffalse <= VAR_MUX_uxn_device_h_l90_c20_c77f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l90_c20_c77f_return_output := MUX_uxn_device_h_l90_c20_c77f_return_output;

     -- CONST_SR_8[uxn_device_h_l168_c34_7905] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l168_c34_7905_x <= VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_return_output := CONST_SR_8_uxn_device_h_l168_c34_7905_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_cond;
     result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output := result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- BIN_OP_OR[uxn_device_h_l201_c4_abbd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l201_c4_abbd_left <= VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_left;
     BIN_OP_OR_uxn_device_h_l201_c4_abbd_right <= VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output := BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l174_c8_b432] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_cond;
     result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output := result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output;

     -- BIN_OP_AND[uxn_device_h_l206_c9_6059] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l206_c9_6059_left <= VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_left;
     BIN_OP_AND_uxn_device_h_l206_c9_6059_right <= VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output := BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output;

     -- auto_advance_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_cond;
     auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output := auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_cond;
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output := result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_e355] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output;

     -- ctrl_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_cond;
     ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output := ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l111_c12_2cd0] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2cd0_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l111_c22_51c1_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output := result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l110_c16_004e] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_004e_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l110_c26_86c8_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c8_7f1e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l197_c23_83cf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_83cf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l197_c33_c05f_return_output);

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l181_c8_a1e4] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_left;
     BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right <= VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output := BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l113_c13_0f36] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_0f36_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l113_c23_cf55_return_output);

     -- BIN_OP_OR[uxn_device_h_l126_c4_d2c8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left <= VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_left;
     BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right <= VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output := BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l163_c4_4950] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_cond;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output := result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l112_c13_c78b] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_c78b_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l112_c23_7aa4_return_output);

     -- BIN_OP_NEQ[uxn_device_h_l164_c9_8b71] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left <= VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_left;
     BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right <= VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output := BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output;

     -- MUX[uxn_device_h_l89_c19_78f4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l89_c19_78f4_cond <= VAR_MUX_uxn_device_h_l89_c19_78f4_cond;
     MUX_uxn_device_h_l89_c19_78f4_iftrue <= VAR_MUX_uxn_device_h_l89_c19_78f4_iftrue;
     MUX_uxn_device_h_l89_c19_78f4_iffalse <= VAR_MUX_uxn_device_h_l89_c19_78f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l89_c19_78f4_return_output := MUX_uxn_device_h_l89_c19_78f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_88cd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output := CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output := result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- BIN_OP_AND[uxn_device_h_l194_c9_6a74] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l194_c9_6a74_left <= VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_left;
     BIN_OP_AND_uxn_device_h_l194_c9_6a74_right <= VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output := BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output;

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left := VAR_BIN_OP_AND_uxn_device_h_l194_c9_6a74_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left := VAR_BIN_OP_AND_uxn_device_h_l206_c9_6059_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output;
     VAR_x_MUX_uxn_device_h_l164_c5_ad6d_cond := VAR_BIN_OP_NEQ_uxn_device_h_l164_c9_8b71_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond := VAR_BIN_OP_NEQ_uxn_device_h_l181_c8_a1e4_return_output;
     VAR_x_MUX_uxn_device_h_l125_c3_e355_iftrue := VAR_BIN_OP_OR_uxn_device_h_l126_c4_d2c8_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left := VAR_BIN_OP_OR_uxn_device_h_l146_c5_aa77_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue := VAR_BIN_OP_OR_uxn_device_h_l201_c4_abbd_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_abd8_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output;
     VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l140_l153_DUPLICATE_8fac_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l110_c16_004e_return_output;
     VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l111_c12_2cd0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l112_c13_c78b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l113_c13_0f36_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l197_c23_83cf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output;
     VAR_x_MUX_uxn_device_h_l118_c3_c752_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output;
     VAR_y_MUX_uxn_device_h_l131_c3_71ca_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l133_l189_l120_DUPLICATE_d957_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_left := VAR_MUX_uxn_device_h_l89_c19_78f4_return_output;
     VAR_MUX_uxn_device_h_l95_c32_6ab6_cond := VAR_MUX_uxn_device_h_l89_c19_78f4_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue := VAR_MUX_uxn_device_h_l89_c19_78f4_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_right := VAR_MUX_uxn_device_h_l90_c20_c77f_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue := VAR_MUX_uxn_device_h_l90_c20_c77f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue := VAR_auto_advance_MUX_uxn_device_h_l158_c3_dde8_return_output;
     VAR_color_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_color_MUX_uxn_device_h_l107_c3_aae2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_ctrl_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c8_7f1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l174_c8_b432_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l163_c4_4950_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l101_c7_6912] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6912_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_88cd_return_output);

     -- color_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_color_MUX_uxn_device_h_l106_c7_2b07_cond;
     color_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_color_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     color_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_color_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l106_c7_2b07_return_output := color_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l206_c9_9927] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left <= VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_left;
     BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right <= VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output := BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l194_c9_4f65] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left <= VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_left;
     BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right <= VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output := BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output;

     -- x_MUX[uxn_device_h_l125_c3_e355] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c3_e355_cond <= VAR_x_MUX_uxn_device_h_l125_c3_e355_cond;
     x_MUX_uxn_device_h_l125_c3_e355_iftrue <= VAR_x_MUX_uxn_device_h_l125_c3_e355_iftrue;
     x_MUX_uxn_device_h_l125_c3_e355_iffalse <= VAR_x_MUX_uxn_device_h_l125_c3_e355_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c3_e355_return_output := x_MUX_uxn_device_h_l125_c3_e355_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c4_a06a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l124_c7_cfd2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_cfd2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e355_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- ram_addr_MUX[uxn_device_h_l187_c8_f3ed] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_cond;
     ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iftrue;
     ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output := ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l117_c7_db9a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_db9a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c3_c752_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c4_a06a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_cond;
     is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iftrue;
     is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output := is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_cond;
     is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iftrue;
     is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output := is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- y_MUX[uxn_device_h_l131_c3_71ca] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l131_c3_71ca_cond <= VAR_y_MUX_uxn_device_h_l131_c3_71ca_cond;
     y_MUX_uxn_device_h_l131_c3_71ca_iftrue <= VAR_y_MUX_uxn_device_h_l131_c3_71ca_iftrue;
     y_MUX_uxn_device_h_l131_c3_71ca_iffalse <= VAR_y_MUX_uxn_device_h_l131_c3_71ca_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l131_c3_71ca_return_output := y_MUX_uxn_device_h_l131_c3_71ca_return_output;

     -- layer_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_layer_MUX_uxn_device_h_l107_c3_aae2_cond;
     layer_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     layer_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_layer_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l107_c3_aae2_return_output := layer_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l164_c5_ad6d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_cond;
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output := result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output;

     -- auto_advance_MUX[uxn_device_h_l157_c7_0486] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l157_c7_0486_cond <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_cond;
     auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iftrue;
     auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output := auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c4_a06a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_cond;
     result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output := result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output;

     -- flip_y_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_cond;
     flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output := flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- BIN_OP_OR[uxn_device_h_l147_c5_0cc4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_left;
     BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output := BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l168_c24_374d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_374d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l168_c34_7905_return_output);

     -- x_MUX[uxn_device_h_l118_c3_c752] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l118_c3_c752_cond <= VAR_x_MUX_uxn_device_h_l118_c3_c752_cond;
     x_MUX_uxn_device_h_l118_c3_c752_iftrue <= VAR_x_MUX_uxn_device_h_l118_c3_c752_iftrue;
     x_MUX_uxn_device_h_l118_c3_c752_iffalse <= VAR_x_MUX_uxn_device_h_l118_c3_c752_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l118_c3_c752_return_output := x_MUX_uxn_device_h_l118_c3_c752_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_cond;
     ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output := ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- x_MUX[uxn_device_h_l164_c5_ad6d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l164_c5_ad6d_cond <= VAR_x_MUX_uxn_device_h_l164_c5_ad6d_cond;
     x_MUX_uxn_device_h_l164_c5_ad6d_iftrue <= VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iftrue;
     x_MUX_uxn_device_h_l164_c5_ad6d_iffalse <= VAR_x_MUX_uxn_device_h_l164_c5_ad6d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l164_c5_ad6d_return_output := x_MUX_uxn_device_h_l164_c5_ad6d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l106_c7_2b07] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_2b07_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_aae2_return_output);

     -- ctrl_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_cond;
     ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iftrue;
     ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_return_output := ctrl_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- MUX[uxn_device_h_l95_c32_6ab6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c32_6ab6_cond <= VAR_MUX_uxn_device_h_l95_c32_6ab6_cond;
     MUX_uxn_device_h_l95_c32_6ab6_iftrue <= VAR_MUX_uxn_device_h_l95_c32_6ab6_iftrue;
     MUX_uxn_device_h_l95_c32_6ab6_iffalse <= VAR_MUX_uxn_device_h_l95_c32_6ab6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c32_6ab6_return_output := MUX_uxn_device_h_l95_c32_6ab6_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l142_c23_c746] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l130_c7_92a9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_92a9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_71ca_return_output);

     -- BIN_OP_OR[uxn_device_h_l91_c21_9c37] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c21_9c37_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_left;
     BIN_OP_OR_uxn_device_h_l91_c21_9c37_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output := BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output;

     -- y_MUX[uxn_device_h_l152_c8_7f1e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l152_c8_7f1e_cond <= VAR_y_MUX_uxn_device_h_l152_c8_7f1e_cond;
     y_MUX_uxn_device_h_l152_c8_7f1e_iftrue <= VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iftrue;
     y_MUX_uxn_device_h_l152_c8_7f1e_iffalse <= VAR_y_MUX_uxn_device_h_l152_c8_7f1e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l152_c8_7f1e_return_output := y_MUX_uxn_device_h_l152_c8_7f1e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output := result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l164_c5_ad6d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output;

     -- flip_x_MUX[uxn_device_h_l107_c3_aae2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l107_c3_aae2_cond <= VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_cond;
     flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iftrue;
     flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output := flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output;

     -- ram_addr_MUX[uxn_device_h_l200_c8_d330] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l200_c8_d330_cond <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_cond;
     ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iftrue;
     ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output := ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l142_c23_c746_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond := VAR_BIN_OP_NEQ_uxn_device_h_l194_c9_4f65_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond := VAR_BIN_OP_NEQ_uxn_device_h_l206_c9_9927_return_output;
     VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c5_0cc4_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond := VAR_BIN_OP_OR_uxn_device_h_l91_c21_9c37_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l168_c24_374d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue := VAR_MUX_uxn_device_h_l95_c32_6ab6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l157_c7_0486_return_output;
     VAR_color_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_color_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_ctrl_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l107_c3_aae2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_flip_x_MUX_uxn_device_h_l107_c3_aae2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_flip_y_MUX_uxn_device_h_l107_c3_aae2_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l88_c2_280e_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_layer_MUX_uxn_device_h_l107_c3_aae2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse := VAR_ram_addr_MUX_uxn_device_h_l187_c8_f3ed_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse := VAR_ram_addr_MUX_uxn_device_h_l200_c8_d330_return_output;
     VAR_result_MUX_uxn_device_h_l101_c7_6912_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l101_c7_6912_return_output;
     VAR_result_MUX_uxn_device_h_l106_c7_2b07_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l106_c7_2b07_return_output;
     VAR_result_MUX_uxn_device_h_l117_c7_db9a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l117_c7_db9a_return_output;
     VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l124_c7_cfd2_return_output;
     VAR_result_MUX_uxn_device_h_l130_c7_92a9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l130_c7_92a9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l164_c5_ad6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c4_a06a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l164_c5_ad6d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c4_a06a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c4_a06a_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_db9a_iftrue := VAR_x_MUX_uxn_device_h_l118_c3_c752_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iftrue := VAR_x_MUX_uxn_device_h_l125_c3_e355_return_output;
     VAR_x_MUX_uxn_device_h_l163_c4_4950_iftrue := VAR_x_MUX_uxn_device_h_l164_c5_ad6d_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_92a9_iftrue := VAR_y_MUX_uxn_device_h_l131_c3_71ca_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_abd8_iffalse := VAR_y_MUX_uxn_device_h_l152_c8_7f1e_return_output;
     -- is_drawing_port_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_cond;
     is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iftrue;
     is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output := is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l206_c4_e376] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_cond;
     result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output := result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output;

     -- x_MUX[uxn_device_h_l163_c4_4950] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l163_c4_4950_cond <= VAR_x_MUX_uxn_device_h_l163_c4_4950_cond;
     x_MUX_uxn_device_h_l163_c4_4950_iftrue <= VAR_x_MUX_uxn_device_h_l163_c4_4950_iftrue;
     x_MUX_uxn_device_h_l163_c4_4950_iffalse <= VAR_x_MUX_uxn_device_h_l163_c4_4950_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l163_c4_4950_return_output := x_MUX_uxn_device_h_l163_c4_4950_return_output;

     -- tmp8_MUX[uxn_device_h_l145_c4_48f4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l145_c4_48f4_cond <= VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_cond;
     tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iftrue;
     tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output := tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output;

     -- flip_y_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_cond;
     flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output := flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- result_u8_value_MUX[uxn_device_h_l164_c5_ad6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_cond;
     result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iftrue;
     result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output := result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output;

     -- color_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_color_MUX_uxn_device_h_l101_c7_6912_cond;
     color_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_color_MUX_uxn_device_h_l101_c7_6912_iftrue;
     color_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_color_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l101_c7_6912_return_output := color_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- ram_addr_MUX[uxn_device_h_l180_c3_27ef] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_cond;
     ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iftrue;
     ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output := ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output := auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- ram_addr_MUX[uxn_device_h_l193_c3_bcf4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_cond;
     ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iftrue;
     ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output := ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c3_27ef] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output;

     -- layer_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_layer_MUX_uxn_device_h_l106_c7_2b07_cond;
     layer_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     layer_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_layer_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l106_c7_2b07_return_output := layer_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l194_c4_7d02] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output := result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l94_c3_b041] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_cond;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output := result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l142_c23_a6ca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_left;
     BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output := BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l194_c4_7d02] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_cond;
     result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output := result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l206_c4_e376] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output := result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l194_c4_7d02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_cond;
     result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iftrue;
     result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output := result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output;

     -- result_u8_value_MUX[uxn_device_h_l206_c4_e376] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_cond;
     result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iftrue;
     result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output := result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c3_27ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_cond;
     result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output := result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output;

     -- y_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_y_MUX_uxn_device_h_l138_c3_abd8_cond;
     y_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     y_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_abd8_return_output := y_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l94_c3_b041] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_cond;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output := result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output;

     -- ctrl_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_cond;
     ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iftrue;
     ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_return_output := ctrl_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_cond;
     ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output := ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c3_27ef] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l163_c4_4950] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output := result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l163_c4_4950] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_cond;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output := result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output;

     -- flip_x_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_cond;
     flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output := flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- Submodule level 4
     VAR_result_u16_addr_uxn_device_h_l142_c4_2bdf := resize(VAR_BIN_OP_PLUS_uxn_device_h_l142_c23_a6ca_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l117_c7_db9a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_50c4_return_output;
     VAR_color_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_color_MUX_uxn_device_h_l101_c7_6912_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_flip_x_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_flip_y_MUX_uxn_device_h_l106_c7_2b07_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_layer_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_layer_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue := VAR_ram_addr_MUX_uxn_device_h_l180_c3_27ef_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue := VAR_ram_addr_MUX_uxn_device_h_l193_c3_bcf4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l163_c4_4950_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l194_c4_7d02_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l206_c4_e376_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l163_c4_4950_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l194_c4_7d02_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l206_c4_e376_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l164_c5_ad6d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l194_c4_7d02_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l206_c4_e376_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue := VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue := VAR_tmp8_MUX_uxn_device_h_l145_c4_48f4_return_output;
     VAR_x_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_x_MUX_uxn_device_h_l163_c4_4950_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_50c4_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_abd8_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue := VAR_result_u16_addr_uxn_device_h_l142_c4_2bdf;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l205_c3_bfbe] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output := result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output;

     -- y_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_y_MUX_uxn_device_h_l137_c7_50c4_cond;
     y_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     y_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_50c4_return_output := y_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output := auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l88_c2_280e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_280e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l94_c3_b041_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l94_c3_b041_return_output);

     -- result_u8_value_MUX[uxn_device_h_l163_c4_4950] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_cond;
     result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iftrue;
     result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output := result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l179_c7_b689] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l179_c7_b689_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c3_27ef_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c3_27ef_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l180_c3_27ef_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l193_c3_bcf4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_cond;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output := result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output;

     -- flip_y_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_cond;
     flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iftrue;
     flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_return_output := flip_y_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- layer_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_layer_MUX_uxn_device_h_l101_c7_6912_cond;
     layer_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_layer_MUX_uxn_device_h_l101_c7_6912_iftrue;
     layer_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_layer_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l101_c7_6912_return_output := layer_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- flip_x_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_cond;
     flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iftrue;
     flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_return_output := flip_x_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- result_u8_value_MUX[uxn_device_h_l205_c3_bfbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_cond;
     result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iftrue;
     result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output := result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output := result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l205_c3_bfbe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_cond;
     result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output := result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l193_c3_bcf4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output := result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- ram_addr_MUX[uxn_device_h_l192_c7_1b7a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_cond;
     ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iftrue;
     ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output := ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_cond;
     ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iftrue;
     ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output := ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- color_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_color_MUX_uxn_device_h_l88_c2_280e_cond;
     color_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_color_MUX_uxn_device_h_l88_c2_280e_iftrue;
     color_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_color_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l88_c2_280e_return_output := color_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_cond;
     result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output := result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- tmp8_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_cond;
     tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output := tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- x_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_x_MUX_uxn_device_h_l158_c3_dde8_cond;
     x_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_x_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     x_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_x_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l158_c3_dde8_return_output := x_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- result_u8_value_MUX[uxn_device_h_l138_c3_abd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_cond;
     result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iftrue;
     result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output := result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output;

     -- result_u8_value_MUX[uxn_device_h_l193_c3_bcf4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_cond;
     result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iftrue;
     result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output := result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_92a9_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_flip_x_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_flip_y_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_layer_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_layer_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse := VAR_ram_addr_MUX_uxn_device_h_l192_c7_1b7a_return_output;
     VAR_result_MUX_uxn_device_h_l88_c2_280e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l88_c2_280e_return_output;
     VAR_result_MUX_uxn_device_h_l179_c7_b689_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l179_c7_b689_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l163_c4_4950_return_output;
     VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue := VAR_tmp8_MUX_uxn_device_h_l138_c3_abd8_return_output;
     VAR_x_MUX_uxn_device_h_l157_c7_0486_iftrue := VAR_x_MUX_uxn_device_h_l158_c3_dde8_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_50c4_return_output;
     -- ctrl_mode_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_cond;
     ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output := ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b26[uxn_device_h_l137_c7_50c4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b26_uxn_device_h_l137_c7_50c4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8b26(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l138_c3_abd8_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c3_abd8_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l138_c3_abd8_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_abd8_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l138_c3_abd8_return_output);

     -- layer_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_layer_MUX_uxn_device_h_l88_c2_280e_cond;
     layer_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_layer_MUX_uxn_device_h_l88_c2_280e_iftrue;
     layer_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_layer_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l88_c2_280e_return_output := layer_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- flip_y_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_cond;
     flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iftrue;
     flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_return_output := flip_y_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- tmp8_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_cond;
     tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output := tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- ram_addr_MUX[uxn_device_h_l179_c7_b689] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l179_c7_b689_cond <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_cond;
     ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iftrue;
     ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output := ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output;

     -- y_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_y_MUX_uxn_device_h_l130_c7_92a9_cond;
     y_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     y_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_92a9_return_output := y_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- flip_x_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_cond;
     flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iftrue;
     flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_return_output := flip_x_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l158_c3_dde8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_cond;
     result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iftrue;
     result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output := result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output := auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l204_c7_3177] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l204_c7_3177_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l205_c3_bfbe_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l205_c3_bfbe_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l205_c3_bfbe_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l192_c7_1b7a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l192_c7_1b7a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l193_c3_bcf4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l193_c3_bcf4_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l193_c3_bcf4_return_output);

     -- x_MUX[uxn_device_h_l157_c7_0486] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l157_c7_0486_cond <= VAR_x_MUX_uxn_device_h_l157_c7_0486_cond;
     x_MUX_uxn_device_h_l157_c7_0486_iftrue <= VAR_x_MUX_uxn_device_h_l157_c7_0486_iftrue;
     x_MUX_uxn_device_h_l157_c7_0486_iffalse <= VAR_x_MUX_uxn_device_h_l157_c7_0486_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l157_c7_0486_return_output := x_MUX_uxn_device_h_l157_c7_0486_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_92a9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l88_c2_280e_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l88_c2_280e_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l88_c2_280e_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse := VAR_ram_addr_MUX_uxn_device_h_l179_c7_b689_return_output;
     VAR_result_MUX_uxn_device_h_l137_c7_50c4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b26_uxn_device_h_l137_c7_50c4_return_output;
     VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l192_c7_1b7a_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_3177_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l204_c7_3177_return_output;
     VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_tmp8_MUX_uxn_device_h_l137_c7_50c4_return_output;
     VAR_x_MUX_uxn_device_h_l137_c7_50c4_iffalse := VAR_x_MUX_uxn_device_h_l157_c7_0486_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_92a9_return_output;
     -- x_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_x_MUX_uxn_device_h_l137_c7_50c4_cond;
     x_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_x_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     x_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_x_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l137_c7_50c4_return_output := x_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- ram_addr_MUX[uxn_device_h_l157_c7_0486] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l157_c7_0486_cond <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_cond;
     ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iftrue;
     ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output := ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output;

     -- auto_advance_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_cond;
     auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output := auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_53a4[uxn_device_h_l157_c7_0486] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_53a4_uxn_device_h_l157_c7_0486_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_53a4(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l158_c3_dde8_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l158_c3_dde8_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l158_c3_dde8_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l158_c3_dde8_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l158_c3_dde8_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l158_c3_dde8_return_output);

     -- y_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_y_MUX_uxn_device_h_l124_c7_cfd2_cond;
     y_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     y_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_cfd2_return_output := y_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- tmp8_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_cond;
     tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output := tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_50c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_auto_advance_MUX_uxn_device_h_l117_c7_db9a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse := VAR_ram_addr_MUX_uxn_device_h_l157_c7_0486_return_output;
     VAR_result_MUX_uxn_device_h_l157_c7_0486_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_53a4_uxn_device_h_l157_c7_0486_return_output;
     VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_tmp8_MUX_uxn_device_h_l130_c7_92a9_return_output;
     VAR_x_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_x_MUX_uxn_device_h_l137_c7_50c4_return_output;
     VAR_y_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     -- tmp8_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_cond;
     tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output := tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- x_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_x_MUX_uxn_device_h_l130_c7_92a9_cond;
     x_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_x_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     x_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_x_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l130_c7_92a9_return_output := x_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- ram_addr_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_cond;
     ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output := ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output := auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l157_c7_0486] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output;

     -- y_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_y_MUX_uxn_device_h_l117_c7_db9a_cond;
     y_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_y_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     y_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_y_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l117_c7_db9a_return_output := y_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l157_c7_0486_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l137_c7_50c4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_tmp8_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_x_MUX_uxn_device_h_l130_c7_92a9_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_y_MUX_uxn_device_h_l117_c7_db9a_return_output;
     -- auto_advance_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output := auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l179_c7_b689] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output;

     -- ram_addr_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_cond;
     ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output := ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- y_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_y_MUX_uxn_device_h_l106_c7_2b07_cond;
     y_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     y_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_2b07_return_output := y_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- x_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_x_MUX_uxn_device_h_l124_c7_cfd2_cond;
     x_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     x_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_x_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l124_c7_cfd2_return_output := x_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- tmp8_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_cond;
     tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output := tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l179_c7_b689_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l130_c7_92a9_return_output;
     VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_tmp8_MUX_uxn_device_h_l117_c7_db9a_return_output;
     VAR_x_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_x_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_2b07_return_output;
     -- auto_advance_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_cond;
     auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iftrue;
     auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output := auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- y_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_y_MUX_uxn_device_h_l101_c7_6912_cond;
     y_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_6912_iftrue;
     y_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_6912_return_output := y_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l192_c7_1b7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output;

     -- x_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_x_MUX_uxn_device_h_l117_c7_db9a_cond;
     x_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_x_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     x_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_x_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c7_db9a_return_output := x_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- tmp8_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_cond;
     tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output := tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- ram_addr_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_cond;
     ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output := ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l192_c7_1b7a_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_tmp8_MUX_uxn_device_h_l106_c7_2b07_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_x_MUX_uxn_device_h_l117_c7_db9a_return_output;
     VAR_y_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_6912_return_output;
     -- tmp8_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_cond;
     tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iftrue;
     tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_return_output := tmp8_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- ram_addr_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_cond;
     ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output := ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- x_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_x_MUX_uxn_device_h_l106_c7_2b07_cond;
     x_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     x_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_2b07_return_output := x_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- y_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_y_MUX_uxn_device_h_l88_c2_280e_cond;
     y_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_y_MUX_uxn_device_h_l88_c2_280e_iftrue;
     y_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_y_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l88_c2_280e_return_output := y_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l204_c7_3177] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l204_c7_3177_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_ram_addr_MUX_uxn_device_h_l117_c7_db9a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_tmp8_MUX_uxn_device_h_l101_c7_6912_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_2b07_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l88_c2_280e_return_output;
     -- ram_addr_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_cond;
     ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output := ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- x_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_x_MUX_uxn_device_h_l101_c7_6912_cond;
     x_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_6912_iftrue;
     x_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_6912_return_output := x_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- tmp8_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_cond;
     tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iftrue;
     tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_return_output := tmp8_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l213_c1_aefd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output;

     -- Submodule level 12
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l213_c1_aefd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_ram_addr_MUX_uxn_device_h_l106_c7_2b07_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_x_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_6912_return_output;
     -- x_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_x_MUX_uxn_device_h_l88_c2_280e_cond;
     x_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_x_MUX_uxn_device_h_l88_c2_280e_iftrue;
     x_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_x_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l88_c2_280e_return_output := x_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_b547] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output;

     -- ram_addr_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_cond;
     ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iftrue;
     ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output := ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- Submodule level 13
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_b547_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l101_c7_6912_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l88_c2_280e_return_output;
     -- ram_addr_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_cond;
     ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iftrue;
     ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output := ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- screen_blit[uxn_device_h_l215_c46_fae6] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l215_c46_fae6_phase <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_phase;
     screen_blit_uxn_device_h_l215_c46_fae6_ctrl <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_ctrl;
     screen_blit_uxn_device_h_l215_c46_fae6_auto_advance <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_auto_advance;
     screen_blit_uxn_device_h_l215_c46_fae6_x <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_x;
     screen_blit_uxn_device_h_l215_c46_fae6_y <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_y;
     screen_blit_uxn_device_h_l215_c46_fae6_ram_addr <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_ram_addr;
     screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read <= VAR_screen_blit_uxn_device_h_l215_c46_fae6_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output := screen_blit_uxn_device_h_l215_c46_fae6_return_output;

     -- Submodule level 14
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l88_c2_280e_return_output;
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l222_c25_bbc9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_bbc9_return_output := VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output.is_blit_done;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l219_c22_ae6d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_ae6d_return_output := VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l221_c22_830f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_830f_return_output := VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l218_c27_1eb2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1eb2_return_output := VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l220_c30_d285] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_d285_return_output := VAR_screen_blit_uxn_device_h_l215_c46_fae6_return_output.vram_write_layer;

     -- Submodule level 15
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l214_c3_d953] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_d953_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l217_c4_9622,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l218_c27_1eb2_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l219_c22_ae6d_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l220_c30_d285_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l221_c22_830f_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l222_c25_bbc9_return_output);

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l214_c3_d953_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l214_c3_d953_return_output;
     -- result_MUX[uxn_device_h_l214_c3_d953] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l214_c3_d953_cond <= VAR_result_MUX_uxn_device_h_l214_c3_d953_cond;
     result_MUX_uxn_device_h_l214_c3_d953_iftrue <= VAR_result_MUX_uxn_device_h_l214_c3_d953_iftrue;
     result_MUX_uxn_device_h_l214_c3_d953_iffalse <= VAR_result_MUX_uxn_device_h_l214_c3_d953_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l214_c3_d953_return_output := result_MUX_uxn_device_h_l214_c3_d953_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l204_c7_3177_iffalse := VAR_result_MUX_uxn_device_h_l214_c3_d953_return_output;
     -- result_MUX[uxn_device_h_l204_c7_3177] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l204_c7_3177_cond <= VAR_result_MUX_uxn_device_h_l204_c7_3177_cond;
     result_MUX_uxn_device_h_l204_c7_3177_iftrue <= VAR_result_MUX_uxn_device_h_l204_c7_3177_iftrue;
     result_MUX_uxn_device_h_l204_c7_3177_iffalse <= VAR_result_MUX_uxn_device_h_l204_c7_3177_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l204_c7_3177_return_output := result_MUX_uxn_device_h_l204_c7_3177_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iffalse := VAR_result_MUX_uxn_device_h_l204_c7_3177_return_output;
     -- result_MUX[uxn_device_h_l192_c7_1b7a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l192_c7_1b7a_cond <= VAR_result_MUX_uxn_device_h_l192_c7_1b7a_cond;
     result_MUX_uxn_device_h_l192_c7_1b7a_iftrue <= VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iftrue;
     result_MUX_uxn_device_h_l192_c7_1b7a_iffalse <= VAR_result_MUX_uxn_device_h_l192_c7_1b7a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l192_c7_1b7a_return_output := result_MUX_uxn_device_h_l192_c7_1b7a_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l179_c7_b689_iffalse := VAR_result_MUX_uxn_device_h_l192_c7_1b7a_return_output;
     -- result_MUX[uxn_device_h_l179_c7_b689] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l179_c7_b689_cond <= VAR_result_MUX_uxn_device_h_l179_c7_b689_cond;
     result_MUX_uxn_device_h_l179_c7_b689_iftrue <= VAR_result_MUX_uxn_device_h_l179_c7_b689_iftrue;
     result_MUX_uxn_device_h_l179_c7_b689_iffalse <= VAR_result_MUX_uxn_device_h_l179_c7_b689_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l179_c7_b689_return_output := result_MUX_uxn_device_h_l179_c7_b689_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l157_c7_0486_iffalse := VAR_result_MUX_uxn_device_h_l179_c7_b689_return_output;
     -- result_MUX[uxn_device_h_l157_c7_0486] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l157_c7_0486_cond <= VAR_result_MUX_uxn_device_h_l157_c7_0486_cond;
     result_MUX_uxn_device_h_l157_c7_0486_iftrue <= VAR_result_MUX_uxn_device_h_l157_c7_0486_iftrue;
     result_MUX_uxn_device_h_l157_c7_0486_iffalse <= VAR_result_MUX_uxn_device_h_l157_c7_0486_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l157_c7_0486_return_output := result_MUX_uxn_device_h_l157_c7_0486_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l137_c7_50c4_iffalse := VAR_result_MUX_uxn_device_h_l157_c7_0486_return_output;
     -- result_MUX[uxn_device_h_l137_c7_50c4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l137_c7_50c4_cond <= VAR_result_MUX_uxn_device_h_l137_c7_50c4_cond;
     result_MUX_uxn_device_h_l137_c7_50c4_iftrue <= VAR_result_MUX_uxn_device_h_l137_c7_50c4_iftrue;
     result_MUX_uxn_device_h_l137_c7_50c4_iffalse <= VAR_result_MUX_uxn_device_h_l137_c7_50c4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l137_c7_50c4_return_output := result_MUX_uxn_device_h_l137_c7_50c4_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l130_c7_92a9_iffalse := VAR_result_MUX_uxn_device_h_l137_c7_50c4_return_output;
     -- result_MUX[uxn_device_h_l130_c7_92a9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l130_c7_92a9_cond <= VAR_result_MUX_uxn_device_h_l130_c7_92a9_cond;
     result_MUX_uxn_device_h_l130_c7_92a9_iftrue <= VAR_result_MUX_uxn_device_h_l130_c7_92a9_iftrue;
     result_MUX_uxn_device_h_l130_c7_92a9_iffalse <= VAR_result_MUX_uxn_device_h_l130_c7_92a9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l130_c7_92a9_return_output := result_MUX_uxn_device_h_l130_c7_92a9_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iffalse := VAR_result_MUX_uxn_device_h_l130_c7_92a9_return_output;
     -- result_MUX[uxn_device_h_l124_c7_cfd2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l124_c7_cfd2_cond <= VAR_result_MUX_uxn_device_h_l124_c7_cfd2_cond;
     result_MUX_uxn_device_h_l124_c7_cfd2_iftrue <= VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iftrue;
     result_MUX_uxn_device_h_l124_c7_cfd2_iffalse <= VAR_result_MUX_uxn_device_h_l124_c7_cfd2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l124_c7_cfd2_return_output := result_MUX_uxn_device_h_l124_c7_cfd2_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l117_c7_db9a_iffalse := VAR_result_MUX_uxn_device_h_l124_c7_cfd2_return_output;
     -- result_MUX[uxn_device_h_l117_c7_db9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l117_c7_db9a_cond <= VAR_result_MUX_uxn_device_h_l117_c7_db9a_cond;
     result_MUX_uxn_device_h_l117_c7_db9a_iftrue <= VAR_result_MUX_uxn_device_h_l117_c7_db9a_iftrue;
     result_MUX_uxn_device_h_l117_c7_db9a_iffalse <= VAR_result_MUX_uxn_device_h_l117_c7_db9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l117_c7_db9a_return_output := result_MUX_uxn_device_h_l117_c7_db9a_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l106_c7_2b07_iffalse := VAR_result_MUX_uxn_device_h_l117_c7_db9a_return_output;
     -- result_MUX[uxn_device_h_l106_c7_2b07] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l106_c7_2b07_cond <= VAR_result_MUX_uxn_device_h_l106_c7_2b07_cond;
     result_MUX_uxn_device_h_l106_c7_2b07_iftrue <= VAR_result_MUX_uxn_device_h_l106_c7_2b07_iftrue;
     result_MUX_uxn_device_h_l106_c7_2b07_iffalse <= VAR_result_MUX_uxn_device_h_l106_c7_2b07_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l106_c7_2b07_return_output := result_MUX_uxn_device_h_l106_c7_2b07_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l101_c7_6912_iffalse := VAR_result_MUX_uxn_device_h_l106_c7_2b07_return_output;
     -- result_MUX[uxn_device_h_l101_c7_6912] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l101_c7_6912_cond <= VAR_result_MUX_uxn_device_h_l101_c7_6912_cond;
     result_MUX_uxn_device_h_l101_c7_6912_iftrue <= VAR_result_MUX_uxn_device_h_l101_c7_6912_iftrue;
     result_MUX_uxn_device_h_l101_c7_6912_iffalse <= VAR_result_MUX_uxn_device_h_l101_c7_6912_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l101_c7_6912_return_output := result_MUX_uxn_device_h_l101_c7_6912_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l88_c2_280e_iffalse := VAR_result_MUX_uxn_device_h_l101_c7_6912_return_output;
     -- result_MUX[uxn_device_h_l88_c2_280e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l88_c2_280e_cond <= VAR_result_MUX_uxn_device_h_l88_c2_280e_cond;
     result_MUX_uxn_device_h_l88_c2_280e_iftrue <= VAR_result_MUX_uxn_device_h_l88_c2_280e_iftrue;
     result_MUX_uxn_device_h_l88_c2_280e_iffalse <= VAR_result_MUX_uxn_device_h_l88_c2_280e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l88_c2_280e_return_output := result_MUX_uxn_device_h_l88_c2_280e_return_output;

     -- Submodule level 28
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l88_c2_280e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l88_c2_280e_return_output;
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
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
